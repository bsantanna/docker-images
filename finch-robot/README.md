# Finch Robot Java Image

## Build image
```
docker build -t finch-robot .
```

## Run container
```
docker run -t -i --privileged -v /dev/bus/usb:/dev/bus/usb finch-robot
```
