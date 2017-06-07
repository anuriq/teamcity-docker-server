FROM teamcity-base:latest
MAINTAINER Azat Khadiev <anuriq@gmail.com>

ENV TEAMCITY_DATA_PATH=/data/teamcity_server/datadir \
    TEAMCITY_DIST=/opt/teamcity \
    TEAMCITY_LOGS=/opt/teamcity/logs \
    TEAMCITY_INIT=/teamcity_init

EXPOSE 8111
LABEL dockerImage.teamcity.version="latest" \
      dockerImage.teamcity.buildNumber="latest"

COPY run-server.sh /run-server.sh
COPY run-services.sh /run-services.sh
RUN chmod +x /run-server.sh /run-services.sh && sync
COPY dist/teamcity $TEAMCITY_DIST
COPY dist/teamcity_init $TEAMCITY_INIT

VOLUME $TEAMCITY_DATA_PATH \
       $TEAMCITY_LOGS

CMD ["/run-services.sh"]
