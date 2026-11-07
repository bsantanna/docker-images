# nginx-static

**A folder becomes a website.**

`bsantanna/nginx-static` serves whatever you put in it, instantly. Mount a folder with an `index.html`, and it's live on port 80 — gzip on, sensible defaults, zero configuration.

## Run it

```sh
docker run -d --name website -p 8080:80 \
  -v "$PWD/site:/var/www/html/website:ro" \
  bsantanna/nginx-static
```

Open [http://localhost:8080](http://localhost:8080).

## Ship it as an image

Package the site and the server together:

```dockerfile
FROM bsantanna/nginx-static
COPY site/ /var/www/html/website/
```

## Details

| | |
|---|---|
| Document root | `/var/www/html/website` (volume) |
| Index | `index.html`, `index.htm` |
| Port | `80` |
| Server | Nginx stable, on Debian 12 (Bookworm) |

## Tags

| Tag | Meaning |
|---|---|
| `latest` | The newest release. |
| `YYYY.MM.XX` | A fixed release, e.g. `2026.11.01`. Pin this in production. |

Multi-architecture: `linux/amd64` and `linux/arm64`.

## Source

[github.com/bsantanna/docker-images](https://github.com/bsantanna/docker-images/tree/main/images/servers/nginx-static)
