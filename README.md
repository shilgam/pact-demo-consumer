# Consumer App


Product Catalog website provides an interface to query the Product service for product information.

## Usage

1. cd into project's root dir

1. start app:

        $ make start

1. open your browser and navigate to http://localhost:3000


### Run the test suite

1. run all tests at once

        $ make test

1. run only unit tests

        $ make test_unit

1. run only contract tests

        $ make test_contract


### Publish contracts from consumer app to **local** Pact Broker

1. Launch Dockerized [Pact Broker](https://github.com/DiUS/pact_broker-docker) locally:

        $ docker-compose -f docker-compose.pactBroker.yml up
    Pact Broker will be accessible at http://localhost:8081

1. Build docker image for consumer app (Run from separate terminal window)

        $ make build

1. Generate and publish contracts to Pact Broker

        $ make publish_pact

### Publish contracts from consumer app to **remote** Pact Broker

1. Build docker image for consumer app

        $ make build

1. Generate and publish contracts to Pact Broker

        $ PACT_BROKER_URL=https://<YOUR USERNAME>.pact.dius.com.au PACT_BROKER_TOKEN=<YOUR TOKEN> make publish_pact
