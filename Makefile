TESTS = $(shell ls tests)

build:
	cd docker && docker-compose build
	cd devbox && docker-compose build
	cd symfony-base/5.6-fpm && docker-compose build
	cd symfony-base/7.0-fpm && docker-compose build
	cd symfony-base/7.1-fpm && docker-compose build
	cd symfony-db/5.6-fpm   && docker-compose build
	cd symfony-db/7.0-fpm   && docker-compose build
	cd symfony-db/7.1-fpm   && docker-compose build

test:
	@$(foreach dir, $(TESTS), cd tests/$(dir) && make test && make clean;)
