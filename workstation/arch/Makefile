GITCOMMIT := $(shell git rev-parse --short=7 HEAD 2>/dev/null)
PWD := $(shell pwd)
NAME=arch

all: build

build:
	docker build -t latb/${NAME}:${GITCOMMIT} .

push:
	@echo "==> Publishing latb/${NAME}:$(GITCOMMIT)"
	@docker tag latb/${NAME}:$(GITCOMMIT) latb/${NAME}:latest
	@docker push latb/${NAME}:$(GITCOMMIT)
	@docker push latb/${NAME}:latest
	@echo "==> Your image is now available at latb/${NAME}:$(GITCOMMIT)"

run: kill
	docker run -it -h ${NAME} --net=host --rm --privileged --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --privileged -v /var/run/docker.sock:/var/run/docker.sock -v ${PWD}/secrets:/home/secrets -v /Volumes/Data:/Volumes/Data -u bauerdic --name ${NAME} latb/${NAME}:${GITCOMMIT} zsh

ssh:
		mosh --no-init --ssh="ssh -o StrictHostKeyChecking=no -i ~/.ssh/ipad_rsa -p 3222" latb@localhost -- tmux new-session -AD -s main

kill:
	docker kill ${NAME} | true


.PHONY: all build run kill
