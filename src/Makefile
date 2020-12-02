
$(warning $(shell IMAGE_NAME=$(IMAGE_NAME) printenv | grep IMAGE_NAME))
ifndef IMAGE_NAME
	#$(warning IMAGE_NAME is not set)
	IMAGE_NAME=nginx-certbot-carians
endif

DOCKER_BUILD = sudo docker build 

all: build

build: Makefile Dockerfile
	$(DOCKER_BUILD) -t $(IMAGE_NAME) .
	@echo "Done!  Use docker run $(IMAGE_NAME) to run"

push:
	sudo docker push $(IMAGE_NAME) 
