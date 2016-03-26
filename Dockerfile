FROM matthewgall/build-base:latest
MAINTAINER Matthew Gall <matthew@picymru.org.uk>

ENV HOST 127.0.0.1
ENV PORT 80
ENV HUGO_VERSION 0.14
ENV HUGO_BINARY hugo_${HUGO_VERSION}_linux_amd64

ADD https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY}.tar.gz /usr/local/
RUN tar xzf /usr/local/${HUGO_BINARY}.tar.gz -C /usr/local/ \
	&& ln -s /usr/local/${HUGO_BINARY}/${HUGO_BINARY} /usr/local/bin/hugo \
	&& rm /usr/local/${HUGO_BINARY}.tar.gz

WORKDIR /app
COPY . /app

EXPOSE 80

CMD ["hugo","server","--bind","$HOST","--port","$PORT"]