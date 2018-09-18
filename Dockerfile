FROM ubuntu:18.04

RUN apt-get update
RUN apt-get update && apt-get install -y \
    build-essential \
    python-pil \
    python-dev \
    python-numpy \
    git \
    wget \
&& rm -rf /var/lib/apt/lists/*

RUN mkdir /tmp/overviewer
WORKDIR /tmp/overviewer

RUN git clone https://github.com/gmcnew/Minecraft-Overviewer.git .
RUN git checkout minecraft113
RUN python2 setup.py build

RUN wget https://launcher.mojang.com/mc/game/1.13.1/client/8de235e5ec3a7fce168056ea395d21cbdec18d7c/client.jar

RUN touch /var/log/overviewer.log
RUN chmod 775 /var/log/overviewer.log

ADD runOverviewer.sh /opt/overviewer/runOverviewer.sh
RUN chmod +x /opt/overviewer/runOverviewer.sh

CMD ["tail", "-f", "/dev/null"]
