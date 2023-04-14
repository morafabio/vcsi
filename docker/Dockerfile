FROM ubuntu:22.04 as builder

# config
ENV DEBIAN_FRONTEND=noninteractive
ARG APP_LANG=en_US.UTF-8

# os
RUN \
    apt-get update \
    && apt-get install -y --no-install-recommends \
      locales \
      python3 python3-pip \
      ffmpeg \
    && sed -i -e "s/# $APP_LANG UTF-8/$APP_LANG UTF-8/" /etc/locale.gen \
    && dpkg-reconfigure --frontend=$DEBIAN_FRONTEND locales && update-locale LANG="$APP_LANG" \
    && rm -rf /var/lib/apt/lists/*

# sources
COPY ../vcsi /app/vcsi/
COPY ../setup.py /app/setup.py
COPY ./docker/entrypoint.sh /opt/entrypoint.sh
COPY ./docker/profile.sh /opt/profile.sh

# create user
RUN mkdir -p /app \
    && addgroup --system --gid 1337 app \
    && adduser --system --uid 1337 --gid 1337 appuser --home /app --no-create-home \
    && chown -R 1337:1337 /app
WORKDIR /app
USER 1337

# build
RUN /opt/entrypoint.sh pip install --no-cache-dir --upgrade pip -e .

# runtime
ENTRYPOINT ["/opt/entrypoint.sh"]
CMD ["vcsi", "-h"]