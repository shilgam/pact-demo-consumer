# local development

build:
	docker-compose -f docker-compose.yml build

start:
	docker-compose -f docker-compose.yml -f docker-compose.override.yml run --service-ports --rm consumer

test:
	docker-compose -f docker-compose.yml -f docker-compose.override.yml run --rm consumer npm test

test_unit:
	docker-compose -f docker-compose.yml -f docker-compose.override.yml run --rm consumer npm run test:unit

test_contract:
	docker-compose -f docker-compose.yml -f docker-compose.override.yml run --rm consumer npm run test:pact


publish_pact:
	docker-compose -f docker-compose.yml -f docker-compose.override.yml -f docker-compose.publish.yml run --rm consumer sh -c "npm run test:pact && CI=true npm rum posttest:pact"

# ci

test_unit_ci:
	docker-compose -f docker-compose.yml run --rm consumer npm run test:unit

test_contract_ci:
	docker-compose -f docker-compose.yml run --rm consumer npm run test:pact

publish_pact_ci:
	docker-compose -f docker-compose.yml -f docker-compose.publish.yml run --rm consumer sh -c "npm run test:pact && CI=true npm run posttest:pact"
