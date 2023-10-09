FROM python:3.7-alpine
LABEL author=gopi
LABEL blog=sample-application
ARG HOME_DIR='/student-cource'
ADD . $HOME_DIR
ENV MYSQL_USERNAME='root'
ENV MYSQL_PASSWORD='rootroot'
ENV MYSQL_SERVER='localhost'
ENV MYSQL_SERVER_PORT='3306'
ENV MYSQL_DATABASE='sample'
EXPOSE 8080
WORKDIR $HOME_DIR
RUN pip install -r requirements.txt
ENTRYPOINT ["python", "app.py"]
