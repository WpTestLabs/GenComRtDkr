FROM alpine
LABEL repo github.com/WpTestLabs/GenComRtDkr
LABEL maintainer WpTestLabs <_____@gmail.com> 

ENV RCLONE_VERSION=current
ENV ARCH=amd64

RUN apk --update add  	curl  git openssl  rsync tar  \
	  gnupg  gnupg-agent \
	  pwgen haveged  \
	py-pip &&  pip install s3cmd zip unzip
	
RUN apk --no-cache add ca-certificates fuse wget \
&& cd /tmp \
&& wget -q http://downloads.rclone.org/rclone-${RCLONE_VERSION}-linux-${ARCH}.zip 

RUN unzip /tmp/rclone-${RCLONE_VERSION}-linux-${ARCH}.zip
RUN mv /tmp/rclone-*-linux-${ARCH}/rclone /usr/bin \
&& rm -r /tmp/rclone* \
&& addgroup rclone \
&& adduser -h /config -s /bin/ash -G rclone -D rclone \
&&  rm -rf /var/lib/apt/lists/* && rm /var/cache/apk/*

CMD /bin/sh
