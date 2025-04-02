FROM ubuntu:24.04
SHELL ["/bin/bash", "-ic"]

#pacotes essenciais
RUN apt update && apt install -y \
    curl \
    git \
    sudo \
    zip unzip

# Default user
ARG USERNAME=desenv
ARG USER_UID=10001
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --create-home --uid $USER_UID --gid $USER_GID -m $USERNAME -s /bin/bash \
    #
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

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