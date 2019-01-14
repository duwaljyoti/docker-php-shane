FROM nginx:1.10

ADD sites/* /etc/nginx/conf.d/default.conf