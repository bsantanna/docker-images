# NGINX Reverse SSL Proxy image

## Building:
```
docker build -t bsantanna/nginx-ssl-proxy .
```

## Running:
```
docker run -d -p 443:443 -p 80:80 --name nginx-ssl-proxy bsantanna/nginx-ssl-proxy
```

