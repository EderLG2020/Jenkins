## Cargando imagen docker

```bash
docker-compose up -d
```

docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword

docker logs jenkins

# iniciar

docker-compose up -d

# Eliminar imagen

```bash
docker rmi <Id>
```

Jenkins 2.479.2

Prueba imagen
docker run -it jenkins-with-node bash
