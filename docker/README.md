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

CID = container ID or name

docker container ls 				or		 ps
docker container ls -a 			or		 ps -a
docker container rm CID
docker container rm -f CID
docker container start CID
docker container stop CID
docker container restart CID
docker container rename CID <new_name>
docker container exec -it CID bash             or u an provide sh as well instead of bash
docker container logs CID
#docker container attach CID
docker container kill CID
docker container prune  => to delete stopped containers
docker container ls -aq => to list all container id
docker container inspect <container_id or name>
docker image inspect <image_id>

docker container cp <file> <container_id>@<path>
ex: 
docker container cp index.html mynginxContainer:/usr/share/nginx/html/index.html

docker container run -d –name subodhContainer nginx => create container in detached mode with container name as subodhContainer

docker container stop `docker container ps -q` => to stop all running containers
docker container rm `docker container ps -aq` => to delete all stopped containers

docker container export cid > a.tar
docker image import a.tar myImage
docker run -dit myImage bash
