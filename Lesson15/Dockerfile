FROM centos:7

WORKDIR /app

LABEL email="nikolai.bondar@gmail.com"

ENV status="First Dockerfile"

ENV date="12.08.2022"

COPY . .

RUN yum -y update && yum -y install net-tools && yum -y install  python3 && yum -y install  java-11-openjdk  && yum -y install  wget && yum clean all

#RUN yum -y install  wget && yum -y install systemd

RUN /bin/sh -c "wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo"

RUN /bin/sh -c "rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key"

RUN yum -y install jenkins 

EXPOSE 8080

CMD [ "/bin/bash", "find.sh" ]

VOLUME /devops_volume
