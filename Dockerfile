FROM ubuntu:latest
EXPOSE 8545 43824 443 20
WORKDIR  /usr/src/app
COPY . .
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update -y && apt-get upgrade -y
RUN apt install -y git
RUN apt install curl -y
FROM adoptopenjdk/openjdk16:latest
RUN apt-get update
RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update
RUN apt-get install python3.8
RUN apt-get install python3-pip -y
RUN pip install awscli
RUN apt install wget
RUN apt install zip -y
RUN wget https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip -P /opt/sam
RUN unzip /opt/sam/aws-sam-cli-linux-x86_64.zip -d /opt/sam/aws-sam-cli-linux-x86
RUN bash /opt/sam/aws-sam-cli-linux-x86/install
RUN wget https://downloads.gradle-dn.com/distributions/gradle-7.1.1-all.zip -P /opt/gradle
RUN unzip /opt/gradle/gradle-7.1.1-all.zip -d /opt/gradle 
RUN export PATH=$PATH:/opt/gradle/gradle-7.1.1/bin
RUN apt-get install git -y
