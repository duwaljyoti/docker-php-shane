FROM nginx:1.10

RUN mkdir /etc/nginx/sites-enabled
RUN mkdir /etc/nginx/sites-available

ADD example.com /etc/nginx/sites-available/example.com
# ADD default.conf /etc/nginx/conf.d/default.conf
#

RUN ln -s /etc/nginx/sites-available/example.com /etc/nginx/sites-enabled/