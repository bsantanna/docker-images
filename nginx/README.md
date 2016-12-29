# NGINX Static file server

## Building:
```
docker build -t bsantanna/nginx .
```

## Running:
```
docker run -d -p 80:80 --name nginx -v .../website:/var/www/html/website bsantanna/nginx
```
