FROM ubuntu:22.04 as builder

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG en_US.UTF-8

RUN apt-get update \
    \
    && apt-get install -y --no-install-recommends locales \
    && sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
    && dpkg-reconfigure --frontend=noninteractive locales && update-locale LANG=en_US.UTF-8 \
    \
    && apt-get -y install --no-install-recommends \
      ffmpeg \
      python3 \
      python3-setuptools python3-numpy python3-pillow python3-jinja2 python3-texttable python3-parsedatetime \
    \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY vcsi/ /app/vcsi/
COPY setup.py /app/setup.py

RUN python3 setup.py install && rm setup.py

