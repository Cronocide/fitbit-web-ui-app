# This version of Numpy requires python 3.10
FROM python:3.10 AS python
ENV PROJ_NAME=fitbit-web-ui-app
ADD ./requirements.txt /requirements.txt
RUN pip3 install -r /requirements.txt
ADD ./ /$PROJ_NAME
WORKDIR /$PROJ_NAME
CMD gunicorn --chdir src app:server --bind 0.0.0.0:80