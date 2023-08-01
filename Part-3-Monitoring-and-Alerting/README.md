# Monitoring and Alerting With Minecraft, Prometheus, and Grafana on Docker

## Links
[prometheus exporter mod](https://www.curseforge.com/minecraft/mc-mods/prometheus-exporter/download/4054337)

[curse grafana dashboard](https://grafana.com/grafana/dashboards/16508-minecraft-server-stats/)

[spirgot/bukit grafana dashboard](https://raw.githubusercontent.com/sladkoff/minecraft-prometheus-exporter/master/dashboards/minecraft-server-dashboard.json)

[spigot/bukit prometheus exporter git repo](https://github.com/sladkoff/minecraft-prometheus-exporter)

[Docker Hub itzg/minecraft-server Image ](https://hub.docker.com/r/itzg/minecraft-server)

[itzg/minecraft-server Image Docs ](https://docker-minecraft-server.readthedocs.io/en/latest/)

## Run Minecraft with Docker CLI

Run Minecraft with docekr CLI
```bash
docker run -d --name minecraft --network minecraft --network-alias minecraft -p 25565:25565 -e EULA=true -v C:\some\path\on\my\pc:/data --restart on-failure itzg/minecraft-server:latest
```

## Run Minecraft with Docker Compose
1. Put the `docker-compose.yaml` file somewhere on your PC
2. Edit the file to match your environment
3. Run `docker compose up -d` within the same directory where your `docker-compose.yaml` file resides.

## Run Prometheus with Docker CLI
```bash
docker run -d --name prometheus --network minecraft --network-alias prometheus -p 9090:9090 -v C:\some\path\on\my\pc\prometheus.yml:/etc/prometheus/prometheus.yml bitnami/prometheus
```

## Run Grafana with Docker CLI
```bash
docker run -d --name grafana --network minecraft --network-alias grafana -p 3000:3000 -v C:\some\path\on\my\pc:/var/lib/grafana grafana/grafana
```
