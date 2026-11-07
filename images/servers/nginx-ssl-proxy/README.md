# nginx-ssl-proxy

**HTTPS for anything.**

`bsantanna/nginx-ssl-proxy` puts TLS in front of any HTTP service. Give it a certificate and a destination, and it handles the rest — modern protocols only, plain HTTP redirected, the right headers forwarded.

## Set it up

Create a folder with this layout:

```
my-proxy/
├── Dockerfile
├── conf/
│   └── global.conf
└── ssl/
    ├── cert.crt
    └── cert.key
```

**`Dockerfile`**

```dockerfile
FROM bsantanna/nginx-ssl-proxy
```

**`conf/global.conf`** — replace `app.example.com` and `app:8080` with your hostname and service:

```nginx
server {
    listen 80;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    server_name app.example.com;

    ssl_certificate     /etc/nginx/ssl/cert.crt;
    ssl_certificate_key /etc/nginx/ssl/cert.key;
    ssl_protocols       TLSv1.2 TLSv1.3;

    location / {
        proxy_set_header Host              $host;
        proxy_set_header X-Real-IP         $remote_addr;
        proxy_set_header X-Forwarded-For   $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_pass http://app:8080;
    }
}
```

## Run it

```sh
docker build -t my-proxy .
docker run -d --name proxy --network my-network -p 80:80 -p 443:443 my-proxy
```

## How it works

The image uses `ONBUILD`. When you build from it, it copies `conf/global.conf` into Nginx and `ssl/` into `/etc/nginx/ssl/`, so your certificate and routing ship inside your own image.

That image contains your private key. Keep it private.

## Ports

| Port | Purpose |
|---|---|
| `443` | HTTPS |
| `80` | Redirects to HTTPS |

## Tags

| Tag | Meaning |
|---|---|
| `latest` | The newest release. |
| `YYYY.MM.XX` | A fixed release, e.g. `2026.11.01`. Pin this in production. |

Multi-architecture: `linux/amd64` and `linux/arm64`. Nginx stable, on Debian 12 (Bookworm).

## Source

[github.com/bsantanna/docker-images](https://github.com/bsantanna/docker-images/tree/main/images/servers/nginx-ssl-proxy)
