# Joynr Discovery Directory for JavaEE

## Description
This docker image deploys the Joynr Discovery Directory into Payara 5 micro and PostgreSQL jdbc drivers. Additionally it is necessary to configure host and port of a MQTT broker as well as the already mentioned PostgreSQL database.

## Documentation
[Developer Guide](https://github.com/bmwcarit/joynr/blob/master/wiki/java.md)

[Settings](https://github.com/bmwcarit/joynr/blob/master/wiki/JavaSettings.md)

[Joynr Discovery Directory](https://github.com/bmwcarit/joynr/tree/master/java/backend-services/discovery-directory-jee)

[Joynr Discovery Directory war](https://mvnrepository.com/artifact/io.joynr.java.backend-services/discovery-directory-jee)

## Build
```shell
docker build --build-arg PAYARA_VERSION=5.201 --build-arg POSTGRES_VERSION=42.2.5 --build-arg JOYNR_VERSION=1.4.0 . -t holomekc/joynr-discovery-directory-jee:latest
```

## Configuration
* DB_HOST: Host of database
* DB_PORT: Port of database
* DB_USER: Database user
* DB_PASSWORD: Database password
* MQTT_HOST: Host of MQTT broker
* MQTT_PORT: Port of MQTT broker

see docker-compose.yml for an example

## Changelog
### 1 
* PAYARA_VERSION: 5.201
* POSTGRES_VERSION: 42.2.5
* JOYNR_VERSION: 1.4.0