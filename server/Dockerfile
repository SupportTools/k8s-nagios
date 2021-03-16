FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -yq --no-install-recommends \
    apt-utils \
    curl \
    bash \
    perl \
    openssl \
    iputils-ping \
    openssh-client \
    sshpass \
    autoconf \
    bc \
    gawk \
    dc \
    build-essential \
    gcc libc6 \
    make \
    wget \
    unzip \
    apache2 \
    php \
    libapache2-mod-php \
    libgd-dev \
    libmcrypt-dev \
    libssl-dev \
    snmp \
    libnet-snmp-perl \
    gettext
    monitoring-plugins \
    nagios-nrpe-plugin \
    nagios-nrpe-server \
    tar \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN cd /tmp && \
    wget https://github.com/NagiosEnterprises/nagioscore/archive/nagios-4.4.6.tar.gz && \
    tar -xf nagios-*.tar.gz && \
    cd nagioscore-*/ && \
    ./configure --with-httpd-conf=/etc/apache2/sites-enabled && \
    make all

RUN make install-groups-users && usermod -a -G nagios www-data

RUN make install && \
    make install-daemoninit && \
    make install-commandmode && \
    make install-config && \
    make install-webconf && \
    a2enmod rewrite cgi

CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"
