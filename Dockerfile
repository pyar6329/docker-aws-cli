FROM alpine:3.10

WORKDIR /workspace

RUN set -e && \
  apk add --no-cache --virtual .build-tool curl ca-certificates unzip && \
  apk add --no-cache python3 jq bash && \
  curl -sL "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" && \
  unzip awscli-bundle.zip && \
  ln -s /usr/bin/python3 /usr/local/bin/python && \
  ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws && \
  rm -rf awscli-bundle* && \
  apk del --purge .build-tool

CMD ["/usr/local/bin/aws"]
