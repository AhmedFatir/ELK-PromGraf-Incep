
# ELK-PromGraf-Incep

## Project Overview
#### [ELK](https://github.com/AhmedFatir/ELK-Stack) (Elasticsearch, Logstash, and Kibana)
#### [PromGraf](https://github.com/AhmedFatir/Prom-Garfana) (Prometheus, Alertanager, Grafana, and Exporters)
#### [Inception](https://github.com/AhmedFatir/inception) (MriaDb, Nginx, and WordPress)

## Installation

### if you don't have docker and docker-compose on your machine
```bash
apt install curl

apt install docker.io

curl -O -J -L https://github.com/docker/compose/releases/download/v2.11.2/docker-compose-linux-x86_64

chmod +x docker-compose-linux-x86_64

cp ./docker-compose-linux-x86_64 /usr/bin/docker-compose
```

### if you already have docker and docker-compose installed on your machine
```bash
git clone https://github.com/AhmedFatir/ELK-PromGraf-Incep.git

cd ./ELK-PromGraf-Incep && make

# And then you can access:
Kibana        https://localhost:5601/
ElasticSearch https://localhost:9200/
Grafana       https://localhost:3000/
Prometheus    https://localhost:9090/
AlertManager  https://localhost:9093/
WordPress     https://localhost:443/
```
## if you are a 42 student and want to run this project on the school's Mac, you may need to change the path where Docker Desktop on Mac stores its data.
```bash
# Make sure Docker Desktop is not running.

# Use the rsync command to copy the Docker data directory to the new location.
rsync -a ~/Library/Containers/com.docker.docker ~/goinfre/DockerData

# Rename the original directory as a backup, just in case you need to revert(optional).
mv ~/Library/Containers/com.docker.docker ~/Library/Containers/com.docker.docker.backup

# Create a symbolic link from the new location back to the original location.
ln -s ~/goinfre/DockerData/com.docker.docker ~/Library/Containers/com.docker.docker

# Open Docker > Preferences > Resources > File Sharing > Add ~/goinfre to Shared Paths.
```
