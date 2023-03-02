FROM python:2.7

# install nginx
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install nginx vim postgresql-common libpq-dev libpq-dev git python-psycopg2 -y
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

COPY nginx.default /etc/nginx/sites-available/default
COPY etc-agora/* /etc/agora/ 

RUN git clone --branch master --single-branch https://github.com/grnet/agora-sp.git /home/agora-sp && \
    mkdir -p /tmp/agora/agora_emails && \
    mkdir -p /srv/agora && \
    cp /home/agora-sp/requirements.txt /srv/agora/requirements.txt && \
    cp /home/agora-sp/version /srv/agora/version && \
    cp -r /home/agora-sp/agora /srv/agora/agora   
RUN cd /srv/agora && pip install -r requirements.txt --no-cache-dir 
RUN pip install gunicorn --no-cache-dir && \
    pip install psycopg2-binary --no-cache-dir && \
    chown -R www-data:www-data /srv/agora/agora && \
    rm -fr /home/agora-sp

COPY start-server.sh /srv/agora/agora/start-server.sh

RUN chmod +x /srv/agora/agora/start-server.sh

WORKDIR /srv/agora/agora

# start server
EXPOSE 8020
STOPSIGNAL SIGTERM
CMD ["/srv/agora/agora/start-server.sh"]

