FROM alpine
LABEL repo github.com/WpTestLabs/GenComRtDkr
LABEL maintainer WpTestLabs <_____@gmail.com>

RUN apk --update add  	curl  git openssl  rsync tar  \
	  gnupg  gnupg-agent \
	  pwgen haveged  \
	py-pip &&  pip install s3cmd zip unzip   && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

CMD /bin/sh
