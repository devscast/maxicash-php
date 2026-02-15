.DEFAULT_GOAL := help

# -----------------------------------
# Recipes
# -----------------------------------
.PHONY: help
help: ## affiche cet aide
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: lint
lint: ## affiche les erreurs de formatage de code
	php vendor/bin/ecs
	php vendor/bin/phpstan
	php vendor/bin/rector --dry-run

.PHONY: test
test: ## lance les tests
	php vendor/bin/phpunit
