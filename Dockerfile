FROM alpine:latest
MAINTAINER infinitely <sam@infinitely.io>

EXPOSE 8080 9333

ADD weed /usr/local/bin

# Create Data Volume Path
RUN mkdir /data &&\
    chown -R nobody:nobody /data

USER nobody

VOLUME ["/data"]

# Entry Point
ENTRYPOINT ["/usr/local/bin/weed"]

# Default Command
CMD ["version"]


