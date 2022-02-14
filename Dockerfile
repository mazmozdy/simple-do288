FROM docker.io/ibmcom/websphere-liberty:20.0.0.5-full-java11-openj9-ubi
COPY target/simple-stuff.war /config/dropins/
COPY config/server.xml /config/
COPY config/server.env /config/
RUN chgrp -R 0 directory && \
    chmod -R g=u directory
RUN mkdir ./my-special-folder
COPY ./Dockerfile my-special-folder/