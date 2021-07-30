FROM debian:10


RUN apt-get update -yq \
&& apt-get install git python3 python3-pip vim htop sqlite3 -yq \
&& apt-get clean -y \
&& python3 -m pip install Django requests && cd /opt \
&& git clone https://github.com/cyber35590/SSD.git


EXPOSE 8000
VOLUME /data
COPY init.sh /
COPY config /opt/SSD/ssd/config


ENTRYPOINT /bin/bash
CMD bash /init.sh
