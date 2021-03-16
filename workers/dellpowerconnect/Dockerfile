FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -yq --no-install-recommends \
    apt-utils \
    curl \
    bash \
    perl \
    openssl \
    iputils-ping \
    libnet-snmp-perl \
    openssh-client \
    sshpass \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY scripts/* /mnt/scripts/
RUN chmod +x /mnt/scripts/*

CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"
