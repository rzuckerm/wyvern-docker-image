FROM openjdk:11-slim

ENV PATH=/opt/wyvern/bin:${PATH}
COPY WYVERN_* /tmp/
RUN apt-get update && \
    apt-get install -y wget unzip && \
    wget https://wyvernlang.github.io/files/WyvernDemo$(cat /tmp/WYVERN_VERSION).zip -O /tmp/wyvern.zip && \
    mkdir -p /opt && \
    cd /opt && \
    unzip /tmp/wyvern.zip && \
    mv WyvernDemo$(cat /tmp/WYVERN_VERSION) wyvern && \
    cd wyvern && \
    rm -rf /tmp/wyvern.zip /opt/wyvern/examples && \
    apt-get remove -y wget unzip && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
