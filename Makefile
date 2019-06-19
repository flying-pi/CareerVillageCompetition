WORKDIR := $(shell pwd)

help: ## Display help message
	@echo "Please use \`make <target>' where <target> is one of"
	@perl -nle'print $& if m{^[\.a-zA-Z_-]+:.*?## .*$$}' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m  %-25s\033[0m %s\n", $$1, $$2}'

up_server: .build/image ## Runs jupiter server
	docker run -it -p '8888:8888' -v $(WORKDIR):/home/jovyan/work/ fpi/career_village_competition:latest bash -c "start-notebook.sh --NotebookApp.token='empty' --ip 0.0.0.0 --no-browser --allow-root"

.build/image: .build requirements.txt
	docker build -t fpi/career_village_competition .
	touch $@

.build:
	mkdir .build
