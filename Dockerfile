FROM ubuntu:latest
EXPOSE 8545 43824 443 20
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update -y && apt-get upgrade -y
RUN apt install -y git
RUN apt install curl -y
FROM adoptopenjdk/openjdk16:latest
RUN apt-get -y python3
RUN apt-get -y install python3-pip
RUN pip install awscli
RUN apt install wget
RUN apt install zip -y
RUN wget https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip -P /opt/sam
RUN unzip /opt/sam/aws-sam-cli-linux-x86_64.zip -d /opt/sam/aws-sam-cli-linux-x86
RUN wget https://downloads.gradle-dn.com/distributions/gradle-7.1.1-all.zip -P /opt/gradle
RUN unzip /opt/gradle/gradle-7.1.1-all.zip -d /opt/gradle/gradle-7.1.1-all.zip 