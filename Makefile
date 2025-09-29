.DEFAULT_GOAL := help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

run: ## Run speak-friend
	@deno run --allow-read --allow-net main.ts

build-docker: ## Build docker container
	@docker build -t speak-friend -t ghcr.io/mando/speak-friend:latest .

run-docker: ## Run docker container
	@docker run --rm -it -p 8080:8080 ghcr.io/mando/speak-friend

push-docker: ## Push docker container
	@docker push ghcr.io/mando/speak-friend:latest
