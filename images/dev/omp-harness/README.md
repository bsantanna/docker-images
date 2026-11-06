### Running the omp harness

```bash
docker run -it --rm \
  -e LAN_LLM_API_KEY=... \
  -e LANGFUSE_API_KEY=... \
  -v "$PWD:/home/omp/workspace" \
  bsantanna/omp-harness
```

The image runs as UID 10001; ensure the bind-mounted workspace is writable by that UID.

`python`/`python3` resolve to a uv-managed CPython 3.13 in `/opt/uv`, which backs omp's Python eval tool. `uv`/`uvx` are on PATH for project environments and extra Python versions (`uv python install 3.12`).
