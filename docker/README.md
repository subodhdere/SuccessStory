# SuccessStory

## Docker Installation

For RHEL :
```sh
yum install docker -y   
systemctl status docker
systemctl start docker
docker version
systemctl enable docker
```

For Ubuntu :
```sh
apt update
apt install docker.io -y   
systemctl status docker
systemctl start docker
docker version
systemctl enable docker
```

```sh
Setup terminal
==============
export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\n~ > "
```

## Docker Container
> Note: CID = container ID or name
```sh
docker info
docker image pull nginx
docker image ls
docker container run nginx => create container in atached mode with random name
docker container run -d nginx => create container in detached mode with random name
docker container run -d --name c1 nginx => create container in detached mode with container name as c1
docker container ls or ps
docker container ls -a or ps -a
docker container rm CID
docker container rm -f CID
docker container start CID
docker container stop CID
docker container restart CID
docker container rename CID <new_name>
docker container exec -it CID bash => or u an provide sh as well instead of bash
docker container logs CID
docker container kill CID
docker container prune  => to delete stopped containers
docker container ls -aq => to list all container id
docker container inspect <container_id or name>
docker image inspect <image_id>
docker stats
docker container commit CID newImage
docker image history nginx

docker container cp file_name container_id@path
docker container cp index.html mynginxContainer:/usr/share/nginx/html/index.html

docker container stop $(docker container ps -aq) => to stop all running containers
docker container rm $(docker container ps -aq) => to delete all stopped containers

docker image save nginx_figlet > nginx_figlet.tar
docker image load -i nginx_figlet.tar OR docker image load < nginx_figlet.tar

docker container -d -p <host_port>:<container_port> nginx 
docker container run -d -p 1234:80 nginx

useradd user1
usermod -aG docker user1
su - user1
docker container ps
```

## Dockerfile
```sh
Istructions: 
    FROM
    RUN
    COPY
    ADD
    USER
    WORKDIR
    ENV
    EXPOSE
    ENTRYPOINT
    CMD
docker image build -t mynginx .
docker image build -t mynginx -f mydockerfile .
docker image history nginx
```

## Push to DockerHub
```sh
docker login
docker image tag myImage subodhdere/imagename:v1
docker image push subodhdere/imagename:v1
```

## Docker Volume
```sh
docker volume create	=> Create a volume
docker volume inspect	=> Display detailed information on one or more volumes
docker volume ls => List volumes
docker volume prune	=> Remove all unused local volumes
docker volume rm => Remove one or more volumes
docker container run -d --name c1 -v /data01 nginx => Anonymous volume
docker container run -d --name c1 -v mynginxvolume:/data01 nginx => Named volume
docker container run -d --name c1 -v /root/learnDocker:/tmp nginx => Host or Bind volume
```

## Docker Network
```sh
docker network connect => Connect a container to a network
docker network create	=> Create a network
docker network disconnect => Disconnect a container from a network
docker network inspect => Display detailed information on one or more networks
docker network ls	=> List networks
docker network prune => Remove all unused networks
docker network rm	=> Remove one or more networks
docker network create mybridge1
docker run -d --network=mybridge1 –name c1 nginx
docker network create mybridge2
docker run -d --network=mybridge2 –name c2 nginx
docker container run -d --network host –name c1 nginx
docker container run -d --network none –name c2 nginx
docker container inspect c1
Install ping inside container:
apt update && apt install inetutils-ping -y && apt install net-tools -y && apt install procps -y
```

## Docker Compose
```sh
Installation: 
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

docker-compose up -d
docker-compose up -d -f docker-compose2.yaml
docker-compose down
docker-compose down -v
docker-compose build
docker-compose up -d --build
docker-compose images
docker-compose up -d --scale web=3
docker-compose ps
docker-compose stop
docker-compose start
docker-compose restart
docker-compose logs
docker-compose top
docker-compose rm
docker-compose rm -s
docker-compose rm -f -s
docker-compose kill
```

## Package Installation:
```sh
netstat : apt install net-tools
ping : apt install inetutils-ping -y
ps : apt install procps
nslookup : apt install dnsutils
```
