FROM ubuntu:20.04

ENV d="mysyte"

WORKDIR /app

LABEL email="nikolai.bondar@gmail.com"

ENV status="httpd Dockerfile"

ENV date="16.08.2022"

ENV TZ=Europe/Kiev

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY ./public-html/  /var/www/html/

COPY . .

RUN apt-get -y update && apt-get -y install net-tools && apt-get -y install  python3 && apt-get install apache2 -y && apt-get clean all

RUN echo "ServerName 127.0.0.1" >> /etc/apache2/apache2.conf

EXPOSE 80

ENTRYPOINT apachectl -D FOREGROUND

#CMD ["apachectl", "-D", "FOREGROUND"] && \ 
#CMD [ "sh", "-c", "./find.sh" ]
#CMD [ "/bin/bash", "./find.sh" ]
RUN /bin/bash -c "sh ./find.sh"

VOLUME /devops_volume

