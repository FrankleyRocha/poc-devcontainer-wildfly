FROM quay.io/devfile/universal-developer-image:ubi9-latest
SHELL ["/bin/bash", "-ic"]

# Default user
ARG USERNAME=user

USER $USERNAME

WORKDIR /home/$USERNAME
RUN curl -C - -LO https://github.com/wildfly/wildfly/releases/download/35.0.1.Final/wildfly-35.0.1.Final.tar.gz
RUN tar -xvzf wildfly-35.0.1.Final.tar.gz
RUN rm wildfly-35.0.1.Final.tar.gz

RUN echo "export JBOSS_HOME=/home/$USERNAME/wildfly-35.0.1.Final" >> .bashrc
RUN echo "export PATH=\$JBOSS_HOME/bin:\$PATH" >> .bashrc

RUN curl -s "https://get.sdkman.io" | bash
RUN sdk install maven
RUN sdk install java 21.0.6-tem

RUN source ~/.bashrc
RUN add-user.sh -m -u admin -p admin

#VOLUME /home/user/wildfly-35.0.1.Final/standalone/log
#VOLUME /home/user/wildfly-35.0.1.Final/standalone/data
RUN mkdir -p /home/user/wildfly-35.0.1.Final/standalone/log
RUN mkdir -p /home/user/wildfly-35.0.1.Final/standalone/data