.DEFAULT_GOAL := help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

run: ## Run speak-friend
	@deno run --allow-read --allow-net main.ts

build-docker: ## bBuild docker container for speak-friend
	@docker build -t speak-friend .

run-docker: ## Run docker container for speak-frield
	@docker run --rm -it -p 8080:8080 speak-friend
