FROM debian:stable-slim
#Build args
ARG VCS_REF
ARG BUILD_DATE
# Setting resource quota
ARG MIN_MEM=2G
ARG MAX_MEM=2G

RUN groupadd -r dockeruser && useradd -r -g dockeruser dockeruser
# Installing packages
RUN  apt-get update && apt-get install -y gcc gnat && \  
     mkdir /src
#Adding Labels of build
LABEL maintainer="David Brumley <github.com/dbrumley>"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.vcs-ref=$VCS_REF

USER dockeruser
COPY src/vuln.ads /src
COPY corpus /src/corpus
WORKDIR /src
USER root
#Compiling source
RUN gnatmake -o vuln vuln.ads
#Execution
CMD ["/src/vuln"]
