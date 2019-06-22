server {
    listen 80;
    listen [::]:80;

    client_max_body_size 100M;
    server_tokens off;

    root /usr/share/nginx/html;

    index index.html index.php  index.htm index.nginx-debian.html;

    server_name ipfinder.fakedomain.io api.fakedomain.io;

#   security
    include ipfinder.io/security.conf;


    location / {
        proxy_set_header Host $host;
        proxy_pass https://api.ipfinder.io;
    }

    # additional config
    include ipfinder.io/general.conf;
}
