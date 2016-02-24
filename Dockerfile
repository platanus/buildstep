FROM progrium/buildstep:latest
MAINTAINER Juan Ignacio Donoso <juan.ignacio@platan.us>

RUN apt-get update && apt-get install -y \
  mysql-client \
&& rm -rf /var/lib/apt/lists/*

ADD wait_for /usr/local/bin/wait_for
RUN chmod +x /usr/local/bin/wait_for

ONBUILD ADD . /app
ONBUILD RUN /build/builder

