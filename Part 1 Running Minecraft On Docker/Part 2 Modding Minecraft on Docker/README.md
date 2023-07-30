# Running Minecraft on Docker

## Links
[Docker Desktop Windows Install Docs ](https://docs.docker.com/desktop/install/windows-install/)

[Docker Hub itzg/minecraft-server Image ](https://hub.docker.com/r/itzg/minecraft-server)

[itzg/minecraft-server Image Docs ](https://docker-minecraft-server.readthedocs.io/en/latest/)

## Run Minecraft with Docker CLI

Run Minecraft with docekr CLI
```bash
docker run -d --name minecraft -p 25565:25565 -e EULA=true -v C:\some\path\on\my\pc:/data --restart on-failure itzg/minecraft-server:latest
```

## Run Minecraft with Docker Compose
1. Put the `docker-compose.yaml` file somewhere on your PC
2. Edit the file to match your environment
3. Run `docker compose up -d` within the same directory where your `docker-compose.yaml` file resides.