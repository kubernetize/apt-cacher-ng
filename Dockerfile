FROM debian:bookworm-slim

RUN \
    useradd -u 987 -d /var/cache/apt-cacher-ng -M apt-cacher-ng && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y apt-cacher-ng && \
    rm -rf /var/lib/apt/lists/* && \
    ln -sf /dev/stdout /var/log/apt-cacher-ng/apt-cacher.log && \
    ln -sf /dev/stderr /var/log/apt-cacher-ng/apt-cacher.err && \
    chown apt-cacher-ng /run/apt-cacher-ng

USER 987

CMD ["/usr/sbin/apt-cacher-ng", "-c", "/etc/apt-cacher-ng", "ForeGround=1"]
