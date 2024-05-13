IMAGE_NAME = simple-markdown-resume

.PHONY: build clean clean-files clean-image image
.DEFAULT_GOAL := help

help:           ## Show this help
	@awk 'BEGIN {FS = ":.*##"; printf "\033[36m\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

resume:	image	## Compile resume into output formats
	mkdir -p output
	@docker run --rm -u $(id -u):$(id-g) -v "$(PWD)/resume.md:/app/resume.md" -v "$(PWD)/output/:/output/" $(IMAGE_NAME)

image:		## Build the container image
	@docker build -t $(IMAGE_NAME) .

clean: clean-image clean-files	## clean-image and clean-files

clean-image:	## Clean docker image
	@docker rmi -f $(IMAGE_NAME) || true
	@echo 'You can safely ignore "No such image" errors above.'

clean-files:	## Clean output files
	@rm -rf ./output/* || true
	@echo 'You can safely ignore "No such file or directory" errors above.'


