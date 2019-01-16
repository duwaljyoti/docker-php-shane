server {
  listen 80;
  listen [::]:80;

  root /var/www/projects/example.com/html

  index index.php index.html index.htm index.nginx-debian.html;

  server_name example.com www.example.com;
  

  location / {
    try_files $uri $uri/ /index.php?$query_string;
  }