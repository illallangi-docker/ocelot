FROM illallangi/ansible:latest as build
ENV OCELOT_VERSION=972c8d6659a27faa2730b353c2389c2b563a2cd7
ENV OCELOT_SHA256=7797195b116efc1dc286aa0687220f6d1a03666b9a6e6cc1d6ef40c7f7869792
COPY build/* /etc/ansible.d/build/
RUN /usr/local/bin/ansible-runner.sh build

FROM illallangi/ansible:latest as image
ENV FLYWAY_VERSION=5.0.5
ENV FLYWAY_SHA256=118d5848f5a8c6e5ed6dad7dd32a7f5331d2d7594e5aac7a035d713d18f6042f

COPY --from=build /usr/local/src/Ocelot-972c8d6659a27faa2730b353c2389c2b563a2cd7/ocelot /usr/local/bin/

COPY image/ /etc/ansible.d/image/
RUN /usr/local/bin/ansible-runner.sh image

ENV USER=ocelot
ENV UID=1024
#ENV OCELOT_SERVERPORT=8100
ENV OCELOT_DB_PORT=3306
#ENV OCELOT_DB_PREFIX=wt_
#ENV OCELOT_LANG=en-US
#ENV OCELOT_PATH=/var/lib/webtrees/data
#ENV OCELOT_MAXFILESIZE=20M
COPY container/* /etc/ansible.d/container/
CMD ["/usr/local/bin/ocelot-entrypoint.sh"]
