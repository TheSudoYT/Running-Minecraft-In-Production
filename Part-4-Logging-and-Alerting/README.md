# Audit Logging and Alerting With Minecraft, Promtail, Loki, and Grafana on Docker

## Links
[Docker Hub itzg/minecraft-server Image ](https://hub.docker.com/r/itzg/minecraft-server)

[itzg/minecraft-server Image Docs ](https://docker-minecraft-server.readthedocs.io/en/latest/)



## Run The Stack with Docker Compose
1. Put the `docker-compose.yaml` file somewhere on your PC
2. Edit the file to match your environment
3. Run `docker compose up -d` within the same directory where your `docker-compose.yaml` file resides.

## Run Minecraft with Docker CLI

Run Minecraft with docekr CLI
```bash
docker run -d --name minecraft --network minecraft --network-alias minecraft -p 25565:25565 -e EULA=true -v C:\some\path\on\my\pc:/data --restart on-failure itzg/minecraft-server:latest
```

## Run Promtail with Docker CLI
```bash
docker run -d --name promtail --network minecraft --network-alias promtail -v C:\path\to\minecraft\logs\on\your\pc:/var/log grafana/promtail
```

## Run Loki with Docker CLI
```bash
docker run -d --name loki --network minecraft --network-alias loki -p 3100:3100 grafana/loki
```

## Run Grafana with Docker CLI
```bash
docker run -d --name grafana --network minecraft --network-alias grafana -p 3000:3000 -v C:\some\path\on\my\pc:/var/lib/grafana grafana/grafana
```