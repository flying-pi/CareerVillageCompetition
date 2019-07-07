WORKDIR := $(shell pwd)

command?=start-notebook.sh --NotebookApp.token='empty' --ip 0.0.0.0 --no-browser --allow-root

help: ## Display help message
	@echo "Please use \`make <target>' where <target> is one of"
	@perl -nle'print $& if m{^[\.a-zA-Z_-]+:.*?## .*$$}' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m  %-25s\033[0m %s\n", $$1, $$2}'

up_server: run_command ## Runs jupiter server

run_demo_graph_builder: command=cd /home/jovyan/work/src && python3 graph_builder/demo_main.py
run_demo_graph_builder: run_command ## Runs demo for the graph.

run_command: .build/image ## Run command in the docker. By defult it runs lab. For set other command use `command` variable
	docker run -it -p '8888:8888' -v $(WORKDIR):/home/jovyan/work/ fpi/career_village_competition:latest bash -c "$(command)"

.build/image: .build requirements.txt Dockerfile
	docker build -t fpi/career_village_competition .
	touch $@

.build:
	mkdir .build
