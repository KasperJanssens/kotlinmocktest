FROM ubuntu:18.04

RUN apt-get update && apt-get install -y openjdk-11-jdk wget

RUN cd /opt/ && wget https://archive.apache.org/dist/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.tar.gz

RUN cd /opt/ && tar -xf apache-maven-3.5.2-bin.tar.gz && mv apache-maven-3.5.2/ apache-maven/

RUN mkdir simpleMockTest

ADD pom.xml simpleMockTest/pom.xml

ADD src/test/kotlin/com/banaan/ExtendWithTest.kt simpleMockTest/src/test/kotlin/com/banaan/ExtendWithTest.kt

# As per https://stackoverflow.com/questions/6784463/error-trustanchors-parameter-must-be-non-empty

RUN /usr/bin/printf '\xfe\xed\xfe\xed\x00\x00\x00\x02\x00\x00\x00\x00\xe2\x68\x6e\x45\xfb\x43\xdf\xa4\xd9\x92\xdd\x41\xce\xb6\xb2\x1c\x63\x30\xd7\x92' > /etc/ssl/certs/java/cacerts

RUN /var/lib/dpkg/info/ca-certificates-java.postinst configure


