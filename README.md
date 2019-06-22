# Reverse Proxy for IPfinder API
[Nginx] setup Nginx as a reverse proxy for IPfinder API

```bash
git clone https://github.com/benemohamed/Reverse-Proxy-for-IPfinder.git
cd  Reverse-Proxy-for-IPfinder
```

### Install requirement
install nginx and php
```bash
sudo apt install nginx php7.2 php7.2-cli php7.2-fpm php7.2-curl php7.2-zip php7.2-xml php7.2-mbstring
```
or
```bash
chmod +x install_requirement.sh
./install_requirement.sh
```

### Setup Reverse Proxy for IPfinder API localy

```bash
chmod +x setup.sh
./setup
 Do you want setup (y/n)?
 Give your domain name to start setup (e.g. google.com, facebook.com)?fffffffff.io
 ✓ You Domain >> fffffffff.io
 ✓ You Domain API  >> http://api.fffffffff.io , http://ipfidner.fffffffff.io

```

## Work php library
[official PHP library for IPfinder](https://github.com/ipfinder-io/ip-finder-php) .
Download the library and test it

```php
// via composer
require  'vendor/autoload.php';

$api = new ipfinder\ipfinder\IPfinder('YOUR_TOKEN_GOES_HERE', 'https://ipfinder.yourdomain.com');

// anually
require_once __DIR__.'autoloader.php';

$api = new ipfinder\ipfinder\IPfinder('YOUR_TOKEN_GOES_HERE', 'https://ipfinder.yourdomain.com');

```

#### Configuration
```nginx
server {
    listen 80;
    listen [::]:80;
    ......
    ......
    ......
    ......
    ......
    ......
    ......
    ......
    location / {
        proxy_set_header Host $host;
        proxy_pass https://api.ipfinder.io;
    }
    ......
    ......
    ......
    ......
    ......
    ......
    ......
    ......
}

```
OK, type in your domain name on the browser, you can access IPfinder API now


#### Using SSL
```nginx
server {
    # SSL

    listen 443 ssl http2;
    listen [::]:443 ssl http2;


    ssl_certificate /etc/letsencrypt/live/example.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/example.com/privkey.pem;
    ssl_trusted_certificate /etc/letsencrypt/live/example.com/chain.pem;
    ......
    ......
    ......
    ......
    ......
    ......
    ......
    ......
    location / {
        proxy_set_header Host $host;
        proxy_pass https://api.ipfinder.io;
        ## add your header for  -->> Referer ,User-Agent,Accept-Language
        # proxy_set_header
    }
    ......
    ......
    ......
    ......
    ......
    ......
    ......
    ......
}
```
> Only for debian and ubuntu users

License
----
[MIT](LICENSE)
