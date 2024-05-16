FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    python3.12 \
    python3-pip \
    git

#RUN pip3 install PyYAML

RUN pip3 install wheel

RUN pip3 install --no-build-isolation "Cython<3" "pyyaml==5.4.1"

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]