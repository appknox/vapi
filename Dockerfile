FROM python:2.7

COPY vAPI.db /var/www/api/vAPI.db
COPY vAPI.py /var/www/api/vAPI.py
COPY vAPI.conf /etc/supervisor/conf.d/
COPY requirements.txt /requirements.txt

RUN apt-get update
RUN apt-get install -y sqlite3 supervisor
RUN pip install -r /requirements.txt

EXPOSE 8081

CMD /usr/bin/supervisord -c /etc/supervisor/supervisord.conf && tail -f /var/log/supervisor/supervisord.log
