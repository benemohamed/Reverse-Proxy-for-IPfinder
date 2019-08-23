# Reverse Proxy for IPfinder API
[Nginx] setup Nginx as a reverse proxy for IPfinder API

### Install with  git
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

## Work with php library
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

## Work with python library
[official Python library for IPfinder](https://github.com/ipfinder-io/ip-finder-python) .
Download the library and test it

```python
import ipfinder

config = ipfinder.config('YOUR_TOKEN_GOES_HERE','https://ipfinder.yourdomain.com')
```

## Work with Node.js library
[official Node.js library for IPfinder](https://github.com/ipfinder-io/ip-finder-node) .
Download the library and test it

```javascript
const Ipfinder = require('ipfinder');
const ipfinder = new Ipfinder('YOUR_TOKEN_GOES_HERE', 'https://ipfinder.yourdomain.com');
```


## Work with Ruby library
[official Ruby library for IPfinder](https://github.com/ipfinder-io/ip-finder-ruby) .
Download the library and test it

```ruby
require 'ipfinder'
config = Ipfinder::config('YOUR_TOKEN_GOES_HERE','https://ipfinder.yourdomain.com')
```

## Work with Java library
[official Java library for IPfinder](https://github.com/ipfinder-io/ip-finder-java) .
Download the library and test it

```java
import io.ipfinder.api.Ipfinder;
import io.ipfinder.api.exception.IPfinderException;
Ipfinder ipfinder = new Ipfinder("YOUR_TOKEN_GOES_HERE", "https://ipfinder.yourdomain.com");
```
## Work with Java D
[Official D client library for IPfinder](https://github.com/ipfinder-io/ip-finder-dlang) .
Download the library and test it

```d
Ipfinder ipfinder = new Ipfinder("YOUR_TOKEN_GOES_HERE", "https://ipfinder.yourdomain.com");

```

## Work with Perl library
[official Perl library for IPfinder](https://github.com/ipfinder-io/ip-finder-perl) .
Download the library and test it

```perl
use IO::IPFinder;

$ipfinder = IO::IPFinder->new('YOUR_TOKEN_GOES_HERE','https://ipfinder.yourdomain.com');
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

#### Test the API in the browser
open You Domain >> fffffffff.io
you will see the home
![home](https://i.imgur.com/GmzUrAy.png)
test free token
![free token ipfinder](https://i.imgur.com/4PHwBRQ.png)
test test with your TOKEN
![your token ipfinder](https://i.imgur.com/vsNAIBm.png)
test ASN number
![test ASN number](https://i.imgur.com/5pQKSFc.png)

test free api = free
Enter the test free api and leave second input emty to get your IP address information



#### Test the API with curl or httpie
open your terminal

```bash
# api.fffffffff.io
# ipfinder.fffffffff.io
curl -XGET http:/ipfinder.fffffffff.io/v1/?token=free

curl -XGET http:/ipfinder.fffffffff.io/v1/12.35.241.23?token=free

```

for more info read [IPFinder documentation](https://ipfinder.io/docs/#getting-started)


License
----

[![GitHub license](https://img.shields.io/github/license/benemohamed/Reverse-Proxy-for-IPfinder.svg)](https://github.com/benemohamed/Reverse-Proxy-for-IPfinder/blob/master/LICENSE)
