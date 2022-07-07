# SuccessStory

# Docker Installation

For RHEL :
* yum install docker -y   
* service docker status
* service docker start
* docker –version
* systemctl enable docker

For Ubuntu :
* apt-get update
* apt-get install docker.io -y   
* service docker status
* service docker start
* docker –version
* systemctl enable docker

# Docker Container Commands:

* CID = container ID or name

* docker container ls 				or		 ps
* docker container ls -a 			or		 ps -a
* docker container rm CID
* docker container rm -f CID
* docker container start CID
* docker container stop CID
* docker container restart CID
* docker container rename CID <new_name>
* docker container exec -it CID bash => or u an provide sh as well instead of bash
* docker container logs CID
* docker container kill CID
* docker container prune  => to delete stopped containers
* docker container ls -aq => to list all container id
* docker container inspect <container_id or name>
* docker image inspect <image_id>
* docker container cp file_name container_id@path
* docker container cp index.html mynginxContainer:/usr/share/nginx/html/index.html
* docker container run -d –name subodhContainer nginx => create container in detached mode with container name as subodhContainer
* docker container stop `docker container ps -q` => to stop all running containers
* docker container rm `docker container ps -aq` => to delete all stopped containers
* docker container export cid > a.tar
* docker image import a.tar myImage
* docker container -d -p <host_port>:<container_port> nginx 
* docker container run -d -p 3456:8080 -e APP_COLOR=red kodekloud/webapp-color

# Dockerfile :
* docker image build -t mynginx .
* docker image build -t mynginx -f mydockerfile .

# Push to DockerHub :
docker login
docker image tag myImage subodhdere/imageName:v1
docker image push subodhdere/imageName:v1

# Docker Volume Commands :
* docker volume create	=> Create a volume
* docker volume inspect	=> Display detailed information on one or more volumes
* docker volume ls => List volumes
* docker volume prune	=> Remove all unused local volumes
* docker volume rm => Remove one or more volumes
* docker container run -d --name c1 -v /data01 nginx => Anonymous volume
* docker container run -d --name c1 -v mynginxvolume:/data01 nginx => Named volume
* docker container run -d --name c1 -v /root/learnDocker:/tmp nginx => Host or Bind volume

# Docker Network Commands :

* docker network connect => Connect a container to a network
* docker network create	=> Create a network
* docker network disconnect => Disconnect a container from a network
* docker network inspect => Display detailed information on one or more networks
* docker network ls	=> List networks
* docker network prune => Remove all unused networks
* docker network rm	=> Remove one or more networks

* docker network create app1
* docker run -d --network=app1 –name c1 nginx

* docker network create app2
* docker run -d --network=app2 –name c2 nginx

* docker container run -d --network host –name c1 nginx
* docker container run -d --network none –name c2 nginx

* docker container inspect c1

Install ping inside container:
* apt-get update && apt-get install inetutils-ping -y

