# Payara-Dockerized

## Payara full docker environment

Docker-compose file for a cluster dockerized Payara environment.

Apache load balancer is setted and persisted by volume, easily configurable.

Payara cluster it's configured, volumes persist all the files related to the new nodes and the DAS.

## Docker composer specifications

- Apache2
- PHP7
- Payara Server Full 181

Built on a docker-compose.yml file.

Note: This environment configuration was made on Windows 10. On Linux the shared folders are not setted before because it works out of the box.
The usual IP used for docker is (192.168.99.100), if differs please replace for your actual setup.

## Requirements

- Docker
- VirtualBox (usually installed with docker)
- GIT (just for clone this repo)

## Installation

- Go into any terminal and clone or fork the project.
- Browse into cloned folder:
    ```bash
    $ cd payara-cluster
    ```
- Create a `.env` from the `.env.dist` file. Configure it according to your needs.
    ```bash
    cp .env.dist .env
    ```
- Build the required images typing in the docker terminal:
    ```bash
    $ docker-compose build
    ```

Extract the content from [das-data](https://drive.google.com/file/d/1xqPuQ0EKpvDAowDWHNLhdCtMCW6iv9ga/view) into /das-data, [nodos](https://drive.google.com/file/d/1HFnFxCqhR7uTT9V0tJdMUtIK1xT9Fh5k/view) into /nodos and all will be setted.

## Use

- Once cloned, go into folder:
    ```bash
    $ cd payara-cluster
    ```
- Create and run the containers typing in the docker terminal:
    ```bash
    $ docker-compose up -d
    ```

### URLs

Ports are configured in `.env` file.

- DAS: <http://192.168.99.100:5001/>
- NODO1 SSH: <http://192.168.99.100:7001/>
- NODO2 SSH: <http://192.168.99.100:7002/>

All other IPs and ports only have internal access.

## Customize

If you dont need more nodes/instances or want to add/remove other containers see this [file](docs/customize.md).

## TODO

- Tests, some configurations.

## Comments

Any comment feel free to mail me: creyent [at] gmail [dot] com

## Contributing

Thanks for contributing!
If you find errors/typos/anything/... please send me a Pull Request, mail me or open an issue.