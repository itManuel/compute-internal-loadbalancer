{
  "service": {
    "name": "backend",
    "port": 8080,
    "check": {
      "id": "backend",
      "name": "HTTP on port 8080",
      "http": "http://localhost:8080/healthz",
      "interval": "10s",
      "timeout": "1s"
    }
  }
}
