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
    gettext \
    monitoring-plugins \
    nagios-nrpe-plugin \
    nagios-nrpe-server \
    locales \
    tar \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

##Set locales
RUN locale-gen en_US.UTF-8 && \
    cd /tmp && \
    wget --no-check-certificate https://github.com/NagiosEnterprises/nagioscore/archive/nagios-4.4.6.tar.gz && \
    tar -xf nagios-*.tar.gz && \
    cd nagioscore-*/ && \
    ./configure --with-httpd-conf=/etc/apache2/sites-enabled && \
    make all && \
    usermod -a -G nagios www-data && \
    make install && \
    make install-daemoninit && \
    make install-commandmode && \
    make install-config && \
    make install-webconf && \
    a2enmod rewrite cgi

RUN rm -f /etc/apache2/sites-enabled/nagios.conf
COPY nagios.conf /etc/apache2/sites-available/
RUN a2dissite 000-default
RUN a2ensite nagios.conf
RUN echo "ServerName localhost" | tee /etc/apache2/conf-available/servername.conf
RUN a2enconf servername
RUN ln -sf /proc/self/fd/1 /var/log/apache2/access.log && \
    ln -sf /proc/self/fd/1 /var/log/apache2/error.log

COPY run.sh /bin/run.sh
CMD /bin/run.sh
