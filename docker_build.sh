# 180807 Reza Farrahi (imriss@yahoo.com)

#
rm master.tar.gz*; wget https://github.com/imriss/docker-squid/archive/master.tar.gz; tar -xvf master.tar.gz;
# tar -xvf master.tar.gz docker-squid-master/Dockerfile

# docker build --squash -t imriss/docker-squid .
cd docker-squid-master/; ./docker_build.sh; cd ..; rm -rd docker-squid-master; rm master.tar.gz*;
