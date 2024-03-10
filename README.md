
# Docker Minecraft JAVA FoliaMC Server 1.20+

FOLIA IS EXPERIMENTAL USE AT YOUR OWN RISK





## Quick Start


```bash
  docker run --rm --name mcserver -e MEMORYSIZE='1G' -v /home/'USER'/mcserver:/data:rw -p 25565:25565 -i connorrandrews/minecraft-foliamc-server:latest
```
The server will generate all data including the world and config files in ```/home/'USER'/mcserver```. Change that to an existing folder (MAKE SURE TO CHANGE 'USER').

## Docker Run Command


```bash
docker run -d \
  --name mcserver \
  --restart=unless-stopped \
  -e MEMORYSIZE="1G" \
  -p 25565:25565/tcp \
  -p 25565:25565/udp \
  -v /home/docker/mcserver:/data:rw \
  connorrandrews/minecraft-foliamc-server:latest
```

## Docker Compose (Portainer Stacks)

```bash
version: "3"
services:
  minecraft:
    image: connorrandrews/minecraft-foliamc-server:latest
    restart: always
    container_name: "mcserver"
    environment:
      MEMORYSIZE: "1G"
      PAPERMC_FLAGS: ""
    volumes:
      - minecraftserver:/data
    ports:
      - "25565:25565"
    # The following allow `docker attach minecraft` to work
    stdin_open: true
    tty: true
volumes:
  minecraftserver:
```

## How do i update the container


```bash
docker pull marctv/minecraft-papermc-server:latest
docker stop mcserver
```

Or just use https://containrrr.dev/watchtower/

## Run as non-root user

You can get the desired UID/GID (xxx) with the ID command (id username) then add the following to your docker run command:

```bash
-e PUID=xxx
-e PGID=xxx
```

#### Skip permission change step

If you have a big custom minecraft install (e.g. multiple plugins which generate files), changing ownership can take up a tremendous amount of time. You can skip this, by making sure that your files have the necessary permissions for the UID/GID that you passed using the environment variables above and then add the following variable:

```bash
-e SKIP_PERM_CHECK=true
```

## Environment variables

MEMORYSIZE = 1G

Not more than 70% of your RAM for your container. This is important. Because this is the RAM, your Minecraft Server will use within the container WITHOUT the operating system.

TZ = Europe/Berlin

Sets the timezone for the container. A list of valid values can be found on Wikipedia: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

PAPERMC_FLAGS = --nojline

Optional: Sets the command-line flags for PaperMC. Remove --nojline if you want to enable color and tab-completion for the server console.

JAVAFLAGS

Optional: Overrides the optimized java parameter configuration with your own. You can set your own Xms and Xmx values this way.

# Credits

On GitHub https://github.com/connorrandrews/docker-minecraft-foliamc-server

Forked from https://github.com/mtoensing/Docker-Minecraft-PaperMC-Server



    
