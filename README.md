##Option 1
```bash
podman build -t cowsay_hello https://github.com/mateus0san/cowsay-flask-podman-httpd.git
podman run -d -p 9001:80 cowsay_hello
```

##Option 2
```bash
git clone https://github.com/mateus0san/cowsay-flask-podman-httpd.git
cd cowsay-flask-podman-httpd/
podman build -t cowsay_hello .
podman run -d -p 9001:80 cowsay_hello
curl localhost:9001
curl "localhost:9001/why%20do%20I%20exist%3F"
```

## Using
```
curl localhost:9001
curl "localhost:9001/why%20do%20I%20exist%3F"
```
### broser
http://localhost:9001/useCurl;-;
