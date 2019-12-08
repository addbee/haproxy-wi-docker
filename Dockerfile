FROM tiangolo/uwsgi-nginx:python3.7
ENV UWSGI_INI /var/www/haproxy-wi/uwsgi.ini

RUN apt-get update && \
	apt-get install fcgiwrap supervisor git net-tools lshw dos2unix gcc netcat python3-pip g++ freetype2-demos libatlas-base-dev libpq-dev python-dev libxml2-dev libxslt1-dev libldap2-dev libsasl2-dev libffi-dev libssl-dev ansible -y

WORKDIR /var/www/haproxy-wi
RUN git clone https://github.com/Aidaho12/haproxy-wi.git /var/www/haproxy-wi && \
	 pip3 install -r requirements.txt && \
	 chmod +x app/tools/*.py && chmod +x app/*.py && mkdir keys configs configs/hap_config/ configs/kp_config/ /log/ && \
	/var/www/haproxy-wi/app/create_db.py

COPY supervisord.conf /etc/supervisor/conf.d/additional.conf
COPY nginx.conf /app/nginx.conf
COPY uwsgi.ini /var/www/haproxy-wi/uwsgi.ini
RUN chown -R nginx:nginx /var/www/haproxy-wi
WORKDIR /var/www/haproxy-wi/

