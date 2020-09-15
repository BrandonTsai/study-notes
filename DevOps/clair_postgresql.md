
docker login -u="application-images+jenkins" -p="6BC26ZL0CUZQTJKL1SWKZIO9ZD58TDLS8O6VONE4VVNF9M1ZQGGMCVBXORNC0BNG" quay-eu-uat.windmill.local
docker pull quay-eu-uat.windmill.local/application-images/test:1
```
skopeo copy --src-tls-verify=false --dest-tls-verify=false docker://registry.redhat.io/rhscl/nginx-116-rhel7 docker://quay-eu-uat.windmill.local/application-images/test:1
```


- name: create clair db user
  shell: docker exec -i pgsql /bin/bash -c 'createuser  {{ clair_pgsql_user }}'
  when: check_clair_user.rc != 0

- debug:
    msg: docker exec -i pgsql /bin/bash -c "echo \"ALTER USER {{ clair_pgsql_user }} WITH PASSWORD '{{ clair_pgsql_password }}';\" | psql"

- name: Giving the user a password
  shell: docker exec -i pgsql /bin/bash -c "echo \"ALTER USER {{ clair_pgsql_user }} WITH PASSWORD '{{ clair_pgsql_password }}';\" | psql"
  # when: check_clair_user.rc != 0

- name: Creating Database
  shell: docker exec -i pgsql /bin/bash -c 'createdb -O {{ clair_pgsql_user }} {{ clair_pgsql_db }} '
  when: check_clair_db.rc != 0

- name: Granting privileges on database
  shell: docker exec -i pgsql /bin/bash -c 'echo "grant all privileges on database {{ clair_pgsql_db }} to {{ clair_pgsql_user }};" | psql'
  when: check_clair_db.rc != 0



- name: Put quay certification files
  copy:
    src: "{{ cluster_region }}-{{cluster_type}}/certs/quay.crt"
    dest: "{{ clair_dir }}/cert/ca.crt"
    mode: 0664
  register: quay_crt

- name: Put quay security_scanner files
  copy:
    src: "security_scanner.pem"
    dest: "{{ clair_dir }}/config/security_scanner.pem"
    mode: 0766
  register: security_scanner

ports:
      - 6060:6060
      - 6061:6061
      - 6062:6062
    volumes:
      - "{{ clair_dir }}/config:/config:rw"
      - "{{ clair_dir }}/cert/ca.crt:/etc/pki/ca-trust/source/anchors/ca.crt:rw"
      - "/var/log/clair:/var/log:rw"
      
      


- name: check quay config file exist or not.
  stat:
    path: "{{ quay_config_dir }}/config.yaml"
  register: config_stat

- name: create config files if not exist
  template:
    src: "config.yaml.j2"
    dest: "{{ quay_config_dir }}/config.yaml"
    mode: 0755
  when: config_stat.stat.exists == False

- name: update quay config if file exist |
  lineinfile:
    path: "{{ quay_config_dir }}/config.yaml"
    regexp: '^DATABASE_SECRET_KEY:'
    line: "DATABASE_SECRET_KEY: {{quay_db_secret_key}}"
  when: config_stat.stat.exists == True

- name: Restart a quay container
  docker_container:
    name: quay
    image: "{{ quay_image }}"
    state: started
    restart: "{% if supervisor.changed or ssl_cert.changed or ssl_key.changed or pgsql_container.changed %} yes {% else %} no {% endif %}"
    sysctls:
      net.core.somaxconn: 4096
    ports:
      - 443:8443
      - 80:8080
      - 9092:9092
    volumes:
      - "{{ quay_config_dir }}:/conf/stack"
      - "{{ quay_storage_dir }}:/datastorage"
      - "{{ quay_log_dir }}:/var/log"
      - "{{ quay_base_dir }}/supervisord.conf.jnj:/quay-registry/conf/supervisord.conf.jnj"
      - "{{ quay_base_dir }}/quay-entrypoint.sh:/quay-registry/quay-entrypoint.sh"
      - "{{ quay_base_dir }}/img/quay-logo.png:/quay-registry/static/img/quay-abn-logo.png"
    privileged : yes
    # init: yes
    env:
      DEBUGLOG: "{{ quay_debug_mode }}"
      TZ: "{{cluster_timezone}}"
    networks:
      - name: network_quay
    restart_policy: always
  
- name: Restart a quay container for mirroring
  docker_container:
    name: quay-repomirror
    image: "{{ quay_image }}"
    state: started
    restart: "{% if supervisor.changed or ssl_cert.changed or ssl_key.changed or pgsql_container.changed %} yes {% else %} no {% endif %}"
    sysctls:
      net.core.somaxconn: 4096
    volumes:
      - "{{ quay_config_dir }}:/conf/stack"
      - "{{ quay_storage_dir }}:/datastorage"
      - "{{ quay_mirror_log_dir }}:/var/log"
