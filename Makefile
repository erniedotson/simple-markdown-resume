IMAGE_NAME = simple-markdown-resume

.PHONY: image clean clean-image clean-files build

resume: image
	@docker run --rm -u $(id -u):$(id-g) -v "$(PWD)/resume.md:/app/resume.md" -v "$(PWD)/output/:/output/" $(IMAGE_NAME)

image:
	@docker build -t $(IMAGE_NAME) .

clean: clean-image clean-files

clean-image:
	@docker rmi -f $(IMAGE_NAME)

clean-files:
	@rm -rf ./output/*


