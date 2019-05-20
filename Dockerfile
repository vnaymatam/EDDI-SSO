FROM jboss/keycloak:4.8.3.Final

MAINTAINER labsai

USER root

WORKDIR /opt/jboss/keycloak/themes/

RUN mkdir -p eddi/login/ && \
    mkdir -p eddi/common

RUN cp -a keycloak/common eddi/common/

COPY /login/ /eddi/login/

ENTRYPOINT [ "/opt/jboss/tools/docker-entrypoint.sh" ]

CMD ["-b", "0.0.0.0"]
