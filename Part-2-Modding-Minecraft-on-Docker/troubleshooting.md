## Preparing spawn area stuck at a certain % and Looping Disconnecting Player (server is still starting): literal{Server is still starting! Please wait before reconnecting.} error
- Possible Solution 1
There is a bottleneck somewhere with resources during world generation meaning Minecraft likely is running out of CPU or RAM resources during worl generation.
- - Add an additional environment variable to your docker container `MAX_MEMORY: "8G"` and set the value to something high if your system has the available resources. Reapply with `docker compose up -d`
- - Close resource intensive applications running on your system hosting the Minecraft server.

- Possible Solution 2
The world data may be corrupt. Delete the minecraft world data and rerun the container

## Authors of mods have disallowed download
- Problem
The mod in question cannot be downloaded using the API. You must manually download the mod.

- Solution 
Go the mods page, find the required version, download it, and drop it into the location mounted to the /data/mods volume within the Minecraft server's docker container.

