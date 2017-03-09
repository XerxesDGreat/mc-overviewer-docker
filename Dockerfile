FROM ubuntu:14.04

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list && \
    echo "deb http://overviewer.org/debian ./" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y --force-yes minecraft-overviewer && \
    apt-get install -y cron

ENV USER_ID=1
ENV GROUP_ID=1

ADD https://s3.amazonaws.com/Minecraft.Download/versions/1.10/1.10.jar /home/daemon/.minecraft/versions/1.10/
ADD crontab /etc/cron.d/overviewer-cron

RUN chmod 0644 /etc/cron.d/overviewer-cron
RUN touch /var/log/cron.log
RUN touch /var/log/overviewer.log

RUN chown -R ${USER_ID}:${GROUP_ID} /home/daemon
ENV HOME=/home/daemon
USER ${USER_ID}:${GROUP_ID}
ADD overviewer.cfg /home

CMD cron && tail -f /var/log/overviewer.log
#ENTRYPOINT ["/bin/bash", "-c","overviewer.py --config=/minecraft/overviewer.cfg;overviewer.py --config=/minecraft/overviewer.cfg --genpoi"]
