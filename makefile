DOCKER_COMPOSE:=docker-compose
DOCKER_COMPOSE_INFRA_FILE:=docker-compose.infra.yml
DOCKER_COMPOSE_SUB_FILE:=docker-compose.sub.yml
DOCKER_COMPOSE_PUB_FILE:=docker-compose.pub.yml

# 1
.PHONY: start-infra
start-infra:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_INFRA_FILE) up -d

# 2
.PHONY: start-sub
start-sub:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_SUB_FILE) up -d

# 3の順に起動
.PHONY: start-pub
start-pub:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_PUB_FILE) up -d

.PHONY: stop-infra
stop-infra:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_INFRA_FILE) stop

.PHONY: stop-sub
stop-sub:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_SUB_FILE) stop

# ここで落としてまた起動とかするとどんどんpubされる
.PHONY: stop-pub
stop-pub:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_PUB_FILE) stop

