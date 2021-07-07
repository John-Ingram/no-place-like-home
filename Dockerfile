FROM ubuntu:20.04

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update && \
    apt-get install -y \
        sudo \
        passwd \
        software-properties-common \
        build-essential # This is just to speed up the startup bits

RUN useradd -u 1000 --user-group --create-home -G sudo jingram
RUN echo jingram:testpassword | chpasswd

COPY . /opt/no-place-like-home
RUN chown -R jingram:jingram /opt/no-place-like-home
RUN echo "jingram ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers

WORKDIR /opt/no-place-like-home
ENV NO_BECOME_PROMPT 1
ENV USER jingram
USER jingram
CMD ./setup
