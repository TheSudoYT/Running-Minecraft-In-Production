# Modding Minecraft on Docker

## Links
[fix-experience-bug ](https://www.curseforge.com/minecraft/mc-mods/fix-experience-bug/download/4587408/)

[Docker Hub itzg/minecraft-server Image ](https://hub.docker.com/r/itzg/minecraft-server)

[itzg/minecraft-server Image Docs ](https://docker-minecraft-server.readthedocs.io/en/latest/)

[all the mods 8 version 1.0.22](https://www.curseforge.com/minecraft/modpacks/all-the-mods-8/files/4633481)

[curse forge developer console](https://console.curseforge.com/?#/api-keys)

## Run Minecraft with Docker CLI

Run Minecraft with docekr CLI
```bash
docker run -d --name minecraft -p 25565:25565 -e EULA=true -e VERSION=1.19.2 -e MAX_MEMORY=8G -e MEMORY=4G -e CF_EXCLUDE_MODS=486778 -e CF_PAGE_URL=https://www.curseforge.com/minecraft/modpacks/all-the-mods-8/files/4633481 -e CF_API_KEY=123456xxxxcvvvbbb234 -e TYPE=AUTO_CURSEFORGE -v C:\some\path\on\my\pc:/data --restart on-failure itzg/minecraft-server:latest
```

## Run Minecraft with Docker Compose
1. Put the `docker-compose.yaml` file somewhere on your PC
2. Edit the file to match your environment per the video
3. Run `docker compose up -d` within the same directory where your `docker-compose.yaml` file resides.