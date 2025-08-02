```bash
podman build -t cowsay_hello .
podman run -d -p 8080:80 cowsay_hello
curl localhost:8080
curl "localhost:8080/why%20do%20I%20exist%3F"
```
