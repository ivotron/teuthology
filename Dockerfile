FROM ubuntu:trusty

ADD . /teuthology

RUN sudo apt-get update && \
    sudo apt-get install -yq \
        python-dev libssl-dev python-pip python-virtualenv libevent-dev \
        python-libvirt libmysqlclient-dev libffi-dev git && \
    sudo apt-get clean && sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    cd /teuthology && ./bootstrap

ENV PATH "$PATH:/teuthology/virtualenv/bin"
