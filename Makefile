

.PHONY: image
image:
	docker build -f Dockerfile \
		--platform linux/amd64 \
		--no-cache \
		-t bignbit:v1 \
		--build-arg USER=`id -u` .


.PHONY: container-shell
container-shell:
	docker run -it --rm \
		--platform linux/amd64 \
		--user `id -u` \
		--env AWS_CONFIG_DIR="/" \
		--env PS1='\s-\v:\w\$$ ' \
		--env HISTFILE="/bignbit/.container_bash_history" \
		-v "${PWD}":/bignbit \
		-v "${HOME}/.aws":/.aws \
		-v "${HOME}/.cache/pip":/.cache/pip \
		-v /var/run/docker.sock:/var/run/docker.sock \
		--name=bignbit \
		bignbit:v1
