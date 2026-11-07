# keycloak

**Identity, ready in seconds.**

`bsantanna/keycloak` is Keycloak 26, pre-built for PostgreSQL with health checks and metrics switched on. The build step happens here, ahead of time, so your container skips it and starts straight away.

## Run it

```sh
docker run -d --name keycloak --network my-network -p 8080:8080 -p 9000:9000 \
  -e KC_DB_URL=jdbc:postgresql://postgres:5432/keycloak \
  -e KC_DB_USERNAME=keycloak \
  -e KC_DB_PASSWORD=change-me \
  -e KC_BOOTSTRAP_ADMIN_USERNAME=admin \
  -e KC_BOOTSTRAP_ADMIN_PASSWORD=change-me \
  bsantanna/keycloak
```

Open the admin console at [http://localhost:8080/admin](http://localhost:8080/admin).

## Configuration

| Variable | Purpose |
|---|---|
| `KC_DB_URL` | JDBC URL of your PostgreSQL database. |
| `KC_DB_USERNAME`, `KC_DB_PASSWORD` | Database credentials. |
| `KC_BOOTSTRAP_ADMIN_USERNAME`, `KC_BOOTSTRAP_ADMIN_PASSWORD` | The first admin account, created on first start. |
| `KC_HOSTNAME` | Public URL, e.g. `https://auth.example.com`. Recommended in production. |

Every other [Keycloak option](https://www.keycloak.org/server/all-config) works too, as a `KC_*` variable or a command-line flag.

## Endpoints

| Port | Path | Purpose |
|---|---|---|
| `8080` | `/` | Keycloak over HTTP. Put TLS in front, for example with [`bsantanna/nginx-ssl-proxy`](https://hub.docker.com/r/bsantanna/nginx-ssl-proxy). |
| `9000` | `/health/ready`, `/health/live` | Health checks for your orchestrator. |
| `9000` | `/metrics` | Prometheus metrics. |

## Defaults

The container runs `start --optimized --http-enabled=true --hostname-strict=false`. Override them by passing your own arguments to `kc.sh`.

## Tags

| Tag | Meaning |
|---|---|
| `latest` | The newest release. |
| `YYYY.MM.XX` | A fixed release, e.g. `2026.11.01`. Pin this in production. |

Multi-architecture: `linux/amd64` and `linux/arm64`.

## Source

[github.com/bsantanna/docker-images](https://github.com/bsantanna/docker-images/tree/main/images/servers/keycloak)
