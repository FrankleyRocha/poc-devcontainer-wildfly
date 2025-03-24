FROM ubuntu:24.04
SHELL ["/bin/bash", "-ic"]

RUN echo deb http://br.archive.ubuntu.com/ubuntu/ noble main restricted > /etc/apt/sources.list
RUN rm -rf /etc/apt/sources.list.d/*

#pacotes essenciais
RUN apt update && apt install -y \
    curl \
    git \
    sudo \
    zip unzip

ARG USERNAME=ubuntu

RUN echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

WORKDIR /home/$USERNAME
RUN curl -C - -LO https://github.com/wildfly/wildfly/releases/download/35.0.1.Final/wildfly-35.0.1.Final.tar.gz
RUN tar -xvzf wildfly-35.0.1.Final.tar.gz
RUN rm wildfly-35.0.1.Final.tar.gz

#COPY jboss-eap-7.4.0.zip .
#RUN unzip jboss-eap-7.4.0.zip
#RUN rm jboss-eap-7.4.0.zip
#RUN echo "export JBOSS_HOME=/home/$USERNAME/jboss-eap-7.4" >> .bashrc

RUN echo "export JBOSS_HOME=/home/$USERNAME/wildfly-35.0.1.Final" >> .bashrc
RUN echo "export PATH=\$JBOSS_HOME/bin:\$PATH" >> .bashrc

USER $USERNAME
RUN curl -s "https://get.sdkman.io" | bash
RUN sdk install maven
RUN sdk install java 21.0.6-tem

RUN source ~/.bashrc
RUN add-user.sh -m -u admin -p admin