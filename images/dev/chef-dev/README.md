# chef-dev

**Your Chef infrastructure, from any machine.**

`bsantanna/chef-dev` is a complete workstation for Chef and CINC — the CINC Client and `knife`, preinstalled and pointed at your repository. Mount it, and manage nodes, cookbooks and roles without installing a thing.

## Run it

From your Chef repository:

```sh
docker run -it --rm -v "$PWD:/opt/workspace/chef-repo" bsantanna/chef-dev
```

Bring your `knife` credentials along:

```sh
docker run -it --rm \
  -v "$PWD:/opt/workspace/chef-repo" \
  -v "$HOME/.chef:/root/.chef:ro" \
  bsantanna/chef-dev knife node list
```

## What's inside

| | |
|---|---|
| CINC Client | 18 — the free, community distribution of Chef Infra |
| `knife` | 18.10 |
| Ruby | 3.2, from [`bsantanna/java-ruby-dev`](https://hub.docker.com/r/bsantanna/java-ruby-dev) |
| Workspace | `/opt/workspace/chef-repo` (volume, default working directory) |

## Tags

| Tag | Meaning |
|---|---|
| `latest` | The newest release. |
| `YYYY.MM.XX` | A fixed release, e.g. `2026.11.01`. Pin this in production. |

Multi-architecture: `linux/amd64` and `linux/arm64`.

## Source

[github.com/bsantanna/docker-images](https://github.com/bsantanna/docker-images/tree/main/images/dev/chef-dev)
