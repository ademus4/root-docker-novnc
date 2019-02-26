FROM ademus4/root-6-14:latest
USER root
WORKDIR /work
ENV HOME /work

# set environment variables
## root
ENV ROOTSYS /usr/local/bin/root

# install python dependancies and extra software
RUN yum install -y python-setuptools nano
RUN easy_install pip
RUN pip install jupyter metakernel zmq ipython

# install requirements for novnc server
RUN yum install -y fluxbox \
    novnc \
    x11vnc \
    xterm \
    xvfb \
    socat \
    supervisor \
    net-tools

# Allow incoming connections
EXPOSE 8080

# Setup demo environment variables
ENV DISPLAY=:0.0 \
    DISPLAY_WIDTH=1024 \
    DISPLAY_HEIGHT=768 \
    RUN_XTERM=yes \
    RUN_FLUXBOX=yes

# general environment variables
ADD environment.sh .bashrc


# run novnc server
COPY . /app
CMD ["/app/entrypoint.sh"]
