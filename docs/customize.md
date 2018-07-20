# Customize the build

Update docker-compose.yml file and add/remove the following lines:

## Remove/Add Node

Cluster has 2 nodes, if you need more:
- Add it to docker-compose.yml file changing the name of the service and the volume (take the Nodo2 example).
- Add to file /apache-php7/apache2/sites-enabled the new node name and port in the BalanceMember section.
- Add the remote node in the DAS.
- Add the new node to the application targets.
- Voilà!

```yml
service:
    # ...
    nodoNuevo:
    image: ${CONTAINER_PREFIX}.nodo
    container_name: ${CONTAINER_PREFIX}.nodoNuevo
    volumes:
      - ${DOCKER_FILES}/nodos/nodoNuevo:/opt/payara41
    links:
      - payara
    ports:
     - ${PAYARA_SSH_NODE_NEW}:22
    networks:
      - cluster
```
Don't forget to add the variables to `.env` file.
