FROM jenkinsci/jenkins:latest
RUN apt-get update \
   && apt-get install -y curl ca-certificates \
  && curl -s https://get.docker.com/ | sed 's/docker-engine/docker-engine=%%DOCKER_VERSION%%*/' | sh \
  && echo 'DOCKER_OPTS="-H :2375 -H unix:///var/run/docker.sock"' >> /etc/default/docker \
   && usermod -aG docker jenkins
