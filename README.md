# Grafana Starter

A barebones, deployable skeleton to get **Grafana observability** up and running quickly. This repo is designed to support both **self-hosted OSS** and **Grafana Cloud** setups, using **Alloy** to port logs and metrics from your services.

---

## Features

- **Self-hosted stack**: Postgres, Prometheus, Loki, Grafana, Alloy
- **Cloud-ready stack**: Alloy pushes logs/metrics to Grafana Cloud
- **Docker Compose templates** for easy deployment
- Minimal configuration to get started quickly

---

## Repository Structure

```
grafana-starter/
├── cloud/
│   ├── compose.yml                  # Alloy only, pushes to Grafana Cloud
│   └── config.alloy                  # Alloy configuration for cloud
├── oss/
│   ├── compose.yml                  # Full stack: Alloy + Postgres + Loki + Prometheus + Grafana
│   └── config/                      # OSS configuration files
│       └── alloy/config.alloy
└── README.md                        # This file
```

---

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/) ≥ 24.x
- [Docker Compose](https://docs.docker.com/compose/install/) ≥ 2.x

Optional for cloud setup:

- Grafana Cloud account and API credentials

---

## Usage

### Self-hosted (OSS)

1. Copy `.env.example` to `.env` and set environment variables:

```bash
POSTGRES_USER=root
POSTGRES_PASSWORD=example
POSTGRES_DB=appdb
ALLOY_CONFIG_PATH=./oss/config/alloy/config.alloy
```

2. Start the full stack:

```bash
docker compose -f oss/compose.yml up -d --build
```

3. Access services:

- Grafana: `http://localhost:3000`
- Loki API: `http://localhost:3100`
- Prometheus: `http://localhost:9090`

Alloy will automatically read logs/metrics from Postgres and push to Loki/Prometheus.

---

### Cloud Setup

1. Copy `.env.cloud.example` to `.env` and set:

```bash
GRAFANA_CLOUD_URL=https://<your-grafana-cloud-instance>
GRAFANA_API_KEY=<your-api-key>
ALLOY_CONFIG_PATH=./cloud/config.alloy
```

2. Start Alloy only:

```bash
docker compose -f cloud/compose.yml up -d --build
```

3. Alloy will push logs and metrics to Grafana Cloud; dashboards are viewable in your cloud instance.

---

## Notes

- The OSS setup is **fully isolated**; no direct mounts of Postgres logs outside its container.
- Alloy is responsible for transporting logs/metrics to Grafana/Loki/Prometheus.
- Networking is handled via a dedicated Docker network to allow container-to-container communication.

---

## Contributing

- Add new services, dashboards, or configuration examples.
- Keep the setup minimal and easy to clone for new projects.

---

## License

MIT [License].
