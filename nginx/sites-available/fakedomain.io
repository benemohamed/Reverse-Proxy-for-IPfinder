server {
    listen 80;
    listen [::]:80;

    client_max_body_size 100M;
    server_tokens off;

    set $base /var/www/fakedomain.io;
    root $base/public;

    index index.html index.php  index.htm index.nginx-debian.html;

    server_name fakedomain.io www.fakedomain.io;

#   security
    include ipfinder.io/security.conf;


#   index.php
    index index.php;

#   index.php fallback
    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    # handle .php
    location ~ \.php$ {
        include ipfinder.io/php_fastcgi.conf;
    }

    # additional config
    include ipfinder.io/general.conf;
}
