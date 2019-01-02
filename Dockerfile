FROM alpine
LABEL repo github.com/WpTestLabs/GenComRtDkr
LABEL maintainer WpTestLabs <_____@gmail.com> 

ENV RCLONE_VERSION=current
ENV ARCH=amd64

RUN apk --update add  	curl  git openssl  rsync tar  unzip  \
    gnupg      pwgen haveged  ca-certificates fuse wget \
&&  rm -rf /var/lib/apt/lists/* && rm /var/cache/apk/*
	
RUN mkdir -p /tmp/rcln && cd /tmp \
&& wget -q http://downloads.rclone.org/rclone-${RCLONE_VERSION}-linux-${ARCH}.zip 

RUN unzip  /tmp/rclone-${RCLONE_VERSION}-linux-${ARCH}.zip -d /tmp/rcln \
&& ls -al /tmp/rcln/`ls /tmp/rcln` && cd /tmp/rcln/`ls /tmp/rcln` \
&& mv ./rclone /usr/bin \
&& rm -r /tmp/rclone*  /tmp/rcln* \
&& addgroup rclone && adduser -h /config -s /bin/ash -G rclone -D rclone 

RUN py-pip &&  pip install --upgrade pip &&   pip install s3cmd zip


CMD /bin/sh
