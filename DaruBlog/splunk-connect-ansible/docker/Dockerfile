FROM sgvlapaacquay.bcc.ap.abn/mirrored-base-images/k8s-metrics:1.1.2

RUN rm /bin/entrypoint.sh
COPY ./entrypoint.sh /bin/entrypoint.sh
RUN chmod 777 /bin/entrypoint.sh

ENV FLUENT_UID=1002 \
    FLUENT_GID=1000

RUN addgroup fluent --gid ${FLUENT_GID}
RUN adduser -D -G fluent -u ${FLUENT_UID} -H fluent
RUN mkdir /fluentd && chown -R fluent /fluentd && chown -R fluent /bin/entrypoint.sh

USER fluent

ENTRYPOINT ["/bin/entrypoint.sh"]
CMD fluentd -c /fluentd/etc/${FLUENTD_CONF}
