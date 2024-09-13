# This version of Numpy requires python 3.10
FROM python:3.10
ENV PROJ_NAME=fitbit-web-ui-app
RUN pip3 install pandas==2.0.3
RUN pip3 install plotly==5.15.0
RUN pip3 install numpy==1.25.0
RUN pip3 install dash==2.11.1 requests==2.29.0
RUN pip3 install gunicorn
RUN pip3 install dash-tools dash-dangerously-set-inner-html
ADD ./ /$PROJ_NAME
WORKDIR /$PROJ_NAME
CMD gunicorn --chdir src app:server --bind 0.0.0.0:80
