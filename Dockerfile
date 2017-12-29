From debian:stretch-slim

ENV USER root

RUN sed -i -e 's/$/ contrib non-free/' /etc/apt/sources.list
RUN apt-get update && apt-get install --no-install-recommends -y \
    dynamips \
    dynagen \
    openssh-server \
    ca-certificates \
    locales \
    lxde \
    tightvncserver \
    xfonts-base \
    iceweasel \
    dbus-x11 ibus-anthy fonts-ipafont \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/sshd

ADD run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]

