docker --version
docker run -d --name mydb -e MYSQL_ROOT_PASSWORD=root mysql
docker run --name mywordpress -d -p 8080:80 --link mydb:mysql wordpress
docker inspect mywordpress
docker system prune -af
docker rm -f $(docker ps -aq)
docker run -d --name myjenkins -p 8080:8080 jenkins/jenkins
docker run --name qaserver -d -p 9090:8080 --link myjenkins:jenkins tomee
docker run --nameprodserver -d -p 7070:8080 --link myjenkins:jenkins tomee
docker run --name prodserver -d -p 7070:8080 --link myjenkins:jenkins tomee
docker rm -f $(docker ps -aq)
docker system prune -af
docker run --name post -d -e POSTGRES_PASSWORD=root -e POSTGRES_USER=venkat -e POSTGRES_DB=sys postgres
docker run -d --name myadminer -p 9090:8080 --link post:adminer adminer
docker system prune -af
docker rm -f $(docker ps -aq)
docker run --name mydb -d -e MYSQL_ROOT_PASSWORD=root mysql
docker run --name apache -d -p 9090:80 --link mydb:apache httpd
docker run --name myphp -d --link mydb:mysql --link apache:httpd php:7.2-apache
docker container ls
docker inspect myphp
docker rm -f $(docker ps -aq)
docker system prune -af
docker --version
docker images
docker run -d --name hub -p 4444:4444 selenium-hub
docker run -d --name hub -p 4444:4444 selenium/hub
docker images
docker container ls
docker system prune -af
docker rm -f $(docker ps -aq)
docker run -d --name hub -p 4444:4444 selenium-hub
docker run -d --name hub -p 4444:4444 selenium/hub
docker run -d --name chrome -p 5900:5901 --link hub:chrome selenium/node-chrome
docker run -d --name firefox -p 5900:5901 --link hub:firefox selenium/node-firefox
docker run -d --name oprea -p 5903:5900 --link hub:opera selenium/node-opera
docker rm -f chrome
docker run -d --name chrome -p 5901:5900 --link hub:chrome selenium/node-chrome
docker rm -f firefox
docker run -d --name firefox -p 5902:5900 --link hub:firefox selenium/node-firefox
docker container ls
docker system prune -af
docker rm -f $(docker ps -aq)
vim docker-compose.yml
docker compose up -d
vim ci-cd.yml
docker compose -f ci-cd.yml -d
docker compose -f ci-cd.yml  up -d
vim postgress.yml
docker compose -f postgres.yml up -d
docker compose -f postgress.yml up -d
vim postgress.yml
docker compose -f postgress.yml up -d
docker compose -f postgress.yml stop
docker compose -f postgress.yml start
vim hub.yml
docker compose -f hub.yml up -d
vim hub.yml
docker compose -f hub.yml up -d
docker rm -f $(docker ps -aq)
docker system prune -af
vim lamp.yml
docker compose -f lamp.yml up -d
docker rm -f $(docker ps -aq)
docker system prune -af
ls
mkdir /data
ls
docker run --name u1 -it -v /data ubuntu
docker inspect u1
docker rm -f u1
cd /var/lib/docker/volumes/63644847f09a02747dd89afaa10eef721296f5a0a5e9c711a818d8575b6a9502/_data
ls
cd
docker run --name t1 -d -p -v /data tomee
docker run --name t1 -d -P -v /data tomee
docker container ls
docker exec -it t1 bash
docker rm -f t1
docker run --name t1 -d -P -v /data tomee
cd /
ls
cd data
ls
touch file2 file3 file4
ls
exit
docker inspect t1
docker rm -f t1
cd /var/lib/docker/volumes/8b442eeeaaaf288e2aaa7968d4d143c3728b8cbdc2808886f15d4026520a2496/_data",























cd /var/lib/docker/volumes/8b442eeeaaaf288e2aaa7968d4d143c3728b8cbdc2808886f15d4026520a2496/_data
ls
exit
docker system prune -af
docker rm -f $(docker ps -aq)
docker run --name t1 -d -P -v /data tomee
docker exc -it t1 bash
docker exec -it t1 bash
docker inspect t1
docker rm -f t1
cd /var/lib/docker/volumes/7b4ab02858f6e68927cef27e58e5eedcda04405959871131fb0d0cd0c07239f8/_data
ls
docker run --name c1 -it -v /data centos
docker run --name c2 -it --volumes-from c1 centos
docker run --name c3 -it -volumes-from c2 centos
docker run --name c3 -it --volumes-from c2 centos
docker attach c1
docker attach c2
ls
docker inspect c1
docker rm -f c1 c2 c3
cd /var/lib/docker/volumes/bbc1e1bd8a40c8b8b10505d1771347a20e22a5878f27f952b7bd213acf520328/_data
ls
cd 
docker volume create myvolume
docker volumes
docker volume ls
docker volume inspect myvolume
cd /var/lib/docker/volumes/myvolume/_data
touch f1 f2
ls
cd 
docker run --name u1 -it -v myvolume:/tmp ubuntu
docker rm -f u1
docker volume ls
docker volume inspect myvolume
cd /var/lib/docker/volumes/myvolume/_data
ls
docker run --name u2 -it -v myvolume:/tmp ubuntu
docker rm -f u2
ls
cd 
docker volume create mynginx
docker volume inspect mynginx
cd /var/lib/docker/volumes/mynginx/_data
ls
vim index.html
cd 
docker run --name n1 -d -P -v mynginx:/usr/share/html nignx
docker run --name n1 -d -P -v mynginx:/usr/share/html nginx
docker container ls
