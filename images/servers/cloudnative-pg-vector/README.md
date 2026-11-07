# cloudnative-pg-vector

**PostgreSQL that understands vectors.**

`bsantanna/cloudnative-pg-vector` is the official CloudNativePG PostgreSQL 17 image with [pgvector](https://github.com/pgvector/pgvector) added. Embeddings, similarity search and RAG, running in the same Kubernetes-native Postgres you already trust.

## Run it

Point your CloudNativePG cluster at the image:

```yaml
apiVersion: postgresql.cnpg.io/v1
kind: Cluster
metadata:
  name: vector-db
spec:
  instances: 3
  imageName: bsantanna/cloudnative-pg-vector:17.11
  storage:
    size: 10Gi
  bootstrap:
    initdb:
      postInitApplicationSQL:
        - CREATE EXTENSION IF NOT EXISTS vector;
```

```sh
kubectl apply -f vector-db.yaml
```

Then search by similarity:

```sql
CREATE TABLE items (id bigserial PRIMARY KEY, embedding vector(3));
INSERT INTO items (embedding) VALUES ('[1,2,3]'), ('[4,5,6]');
SELECT * FROM items ORDER BY embedding <-> '[3,1,2]' LIMIT 5;
```

This image is built for the [CloudNativePG operator](https://cloudnative-pg.io). It isn't meant to run on its own with `docker run`.

## What's inside

| | |
|---|---|
| PostgreSQL | 17.11, CloudNativePG `minimal` flavor, Debian 12 (Bookworm) |
| Extension | `pgvector` |
| User | Runs as UID `26`, as the operator expects |

## Tags

| Tag | Meaning |
|---|---|
| `17.11` | PostgreSQL 17.11 with pgvector. |

Tags follow the PostgreSQL version. Multi-architecture: `linux/amd64` and `linux/arm64`.

## Source

[github.com/bsantanna/docker-images](https://github.com/bsantanna/docker-images/tree/main/images/servers/cloudnative-pg-vector)
