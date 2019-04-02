FROM alpine:latest

RUN apk add --no-cache python3 drill bash && \
    pip3 install --upgrade pip setuptools httpie && \
    rm -r /root/.cache

COPY get-external-ip-via-*.sh /
COPY set-gandi-dns-record.sh /

CMD /set-gandi-dns-record.sh
