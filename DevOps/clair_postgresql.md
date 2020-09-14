

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


