# This file needs to be renamed to Dockerfile

FROM ubuntu

# General Operating System Setup
RUN apt -y update
RUN apt -y install openjdk-17-jdk
RUN apt -y install zip
RUN apt -y install bc
RUN apt -y install passwd
RUN apt -y install telnet
RUN apt -y install apt-utils
RUN apt -y install vim
RUN apt -y install curl 

RUN { echo "password"; echo "password"; } | passwd root
RUN useradd admin
RUN { echo "password"; echo "password"; } | passwd admin
RUN mkdir /home/admin
RUN chown admin:admin /home/admin
USER admin
RUN mkdir /home/admin/App
RUN curl  https://public.dhe.ibm.com/ibmdl/export/pub/software/websphere/wasdev/downloads/wlp/22.0.0.12/wlp-webProfile8-22.0.0.12.zip >  /home/admin/App/wlp.zip
RUN unzip /home/admin/App/wlp.zip -d /home/admin/App
RUN chown -R admin:admin /home/admin/App/wlp
RUN chmod 777 -R /home/admin/App/wlp

RUN cd /home/admin/App/wlp/bin \
&& ./server create sessionserver
COPY --chown=admin:admin ./Liberty/server.xml /home/admin/App/wlp/usr/servers/sessionserver/server.xml
COPY --chown=admin:admin ./Liberty/jvm.options /home/admin/App/wlp/usr/servers/sessionserver/jvm.options
COPY --chown=admin:admin ./sessionwebapp.war /home/admin/App/wlp/usr/servers/sessionserver/dropins/sessionwebapp.war
COPY --chown=admin:admin ./sessionserver-startup.sh /home/admin/sessionserver-startup.sh
RUN chmod 777 home/admin/sessionserver-startup.sh

CMD ["/home/admin/sessionserver-startup.sh"]