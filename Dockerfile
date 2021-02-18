FROM ubuntu:16.04
ENV DEBIAN_FRONTEND="noninteractive" \
TERM="xterm"
RUN apt-get update \
	&& apt-get install apt-utils -y \
	&& apt-get upgrade -y
RUN apt-get install -y apt-utils python python-pip python-pyinotify python-xlrd python-psycopg2 python-paramiko
RUN pip install 'django<1.8' 'cherrypy<8.0' genshi

# Install BOTS
COPY bots-3.2.0.tar /opt/
RUN tar xf /opt/bots-3.2.0.tar 
RUN cd /bots-3.2.0 \
  && python setup.py install 
USER root
#RUN useradd -U -s /bin/false -u 1000710001 botman 
#RUN chown -R botman /usr/local/lib/python2.7/dist-packages/bots 
RUN chgrp -R 0 /usr/local/lib/python2.7/dist-packages/bots
RUN chmod -R g=u /usr/local/lib/python2.7/dist-packages/bots
EXPOSE 8080
USER botman
ENTRYPOINT bots-webserver.py
