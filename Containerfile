FROM ubuntu:22.04

RUN apt-get update &&  \
    apt-get install -y software-properties-common curl wget
RUN add-apt-repository ppa:jean-francois-dockes/upnpp1
RUN apt-get update && apt-get install upmpdcli -y && \
    apt-get remove software-properties-common -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 1900/udp
EXPOSE 49152

ENTRYPOINT ["upmpdcli", "-c", "/etc/upmpdcli.conf"]
