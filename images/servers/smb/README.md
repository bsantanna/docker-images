# smb

**A file server, described in two files.**

`bsantanna/smb` builds a Samba server from a share definition and a list of users. Write them once, build, and every machine on your network has a place to put things — Windows, macOS and Linux alike.

## Set it up

Create a folder with this layout:

```
my-file-server/
├── Dockerfile
└── config/
    ├── smb.conf
    └── users.txt
```

**`Dockerfile`**

```dockerfile
FROM bsantanna/smb
RUN mkdir -p /srv/shared && chgrp staff /srv/shared && chmod 2775 /srv/shared
```

**`config/smb.conf`**

```ini
[global]
   server role = standalone server
   map to guest = never

[shared]
   path = /srv/shared
   valid users = @staff
   read only = no
```

**`config/users.txt`** — one user per line, `username:password:uid:group:gid`:

```
alice:change-me:1001:staff:1001
bob:change-me-too:1002:staff:1001
```

## Run it

```sh
docker build -t my-file-server .
docker run -d --name files \
  -p 139:139 -p 445:445 \
  -v files-data:/srv/shared \
  my-file-server
```

Connect from Finder or Explorer at `smb://<host>/shared`.

## How it works

The image uses `ONBUILD`. When you build from it, it copies `config/`, installs your `smb.conf`, and creates every user and group in `users.txt` as both a system account and a Samba account. At run time it starts `rpcbind`, `nmbd` and `smbd`.

`users.txt` is baked into your image, passwords included. Keep that image private and out of version control.

## Ports

| Port | Purpose |
|---|---|
| `445/tcp` | SMB |
| `139/tcp` | NetBIOS session |
| `138/udp` | NetBIOS datagram |

## Tags

| Tag | Meaning |
|---|---|
| `latest` | The newest release. |
| `YYYY.MM.XX` | A fixed release, e.g. `2026.11.01`. |

Multi-architecture: `linux/amd64` and `linux/arm64`. Based on Debian 12 (Bookworm), slim.

## Source

[github.com/bsantanna/docker-images](https://github.com/bsantanna/docker-images/tree/main/images/servers/smb)
