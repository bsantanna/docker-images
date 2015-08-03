# Docker Image Private Registry

Running registry:

```
docker run -d \
    -p 5000:5000 \
    --name some-registry \
    -e STORAGE_PATH=/registry \
    -e SETTINGS_FLAVOR=s3 \
    -e STORAGE_PATH=/registry \
    -e SEARCH_BACKEND=sqlalchemy \
    registry
```
