{
  "service": {
    "name": "haproxy-internal",
    "port": 8080,
    "check": {
      "id": "haproxy",
      "name": "HTTP on port 8080",
      "http": "http://localhost:8080",
      "interval": "10s",
      "timeout": "1s"
    }
  }
}
