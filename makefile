include ../../../make.inc


build_docker_image:
	@echo "Building docker image..."
	@docker build -t $(DOCKER_IMAGE_NAME) .

run_docker_image:
	@echo "Running docker image..."
	@docker run -it --rm -p $(PORT):$(PORT) -e PORT=$(PORT) $(DOCKER_IMAGE_NAME)

push_docker_image:
	@echo "Pushing docker image..."
	@docker tag $(IMAGE_NAME) $(HOSTNAME)/$(PROJECT_ID)/$(REPOSITORY)/$(IMAGE_NAME):$(IMAGE_TAG)
	@docker push $(HOSTNAME)/$(PROJECT_ID)/$(REPOSITORY)/$(IMAGE_NAME):$(IMAGE_TAG)

deploy_docker_image:
	@echo "Deploying docker image..."
	@gcloud run deploy first-app --image $(HOSTNAME)/$(PROJECT_ID)/$(REPOSITORY)/$(IMAGE_NAME):$(IMAGE_TAG) --region europe-west1
