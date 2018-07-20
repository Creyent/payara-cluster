# Payara-Dockerized

## Payara full docker environment

Docker-compose file for a cluster dockerized Payara environment.

Apache load balancer is setted and persisted by volume, easily configurable.

Payara cluster it's configured, volumes persist all the files related to the new nodes and the DAS. Extract the das-data.rar content into /das-data and all will be setted. 

Cluster has 2 nodes, if you need more:
- Add it to docker-compose.yml file changing the name of the service and the volume (take the Nodo2 example).
- Add to file /apache-php7/apache2/sites-enabled the new node name and port in the BalanceMember section.
- Add the remote node in the DAS.
- Add the new node to the application targets.
- Voilà!

## TODO

- Tests, some configurations.

## Comments

Any comment feel free to mail me: creyent [at] gmail [dot] com

## Contributing

Thanks for contributing!
If you find errors/typos/anything/... please send me a Pull Request, mail me or open an issue.