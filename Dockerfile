FROM ubuntu:14.04

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list && \
    echo "deb http://overviewer.org/debian ./" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y --force-yes minecraft-overviewer

ADD https://s3.amazonaws.com/Minecraft.Download/versions/1.10/1.10.jar /home/daemon/.minecraft/versions/1.10/

RUN touch /var/log/overviewer.log
RUN chmod 775 /var/log/overviewer.log

ADD overviewer.cfg /opt/overviewer/overviewer.cfg
ADD runOverviewer.sh /opt/overviewer/runOverviewer.sh
RUN chmod +x /opt/overviewer/runOverviewer.sh

#ENTRYPOINT ["/bin/bash", "-c","overviewer.py --config=/minecraft/overviewer.cfg;overviewer.py --config=/minecraft/overviewer.cfg --genpoi"]
