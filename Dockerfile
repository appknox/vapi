FROM ubuntu:xenial

RUN apt-get update
RUN apt-get install -y python python-pip sqlite3 supervisor
RUN pip install -r requirements.txt

COPY vAPI.db /var/www/api/vAPI.db
COPY vAPI.py /var/www/api/vAPI.py
COPY vAPI.conf /etc/supervisor/conf.d/

EXPOSE 8081

CMD /usr/bin/supervisord -c /etc/supervisor/supervisord.conf && tail -f /var/log/supervisor/supervisord.log
