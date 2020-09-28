.PHONY: all


clean:
	vagrant destroy -f

destroy: clean

lobcder:
	if [ -d "./mini-lobcder" ]; then \
		echo "lobcder ok"; \
	else \
		git clone https://github.com/micro-infrastructure/mini-lobcder.git; \
	fi

slurm:
	if [ -d "./mini-slurm" ]; then \
		echo "slurm ok"; \
	else \
		git clone https://github.com/micro-infrastructure/mini-slurm.git; \
	fi

infra: lobcder
	if [ -f "./user-infra.json" ]; then \
		echo "user-infra.json ok"; \
		cp user-infra.json mini-lobcder/k8s-setup/; \
	fi

pull: lobcder slurm

rm: 
	rm -rf ./mini-lobcder
	rm -rf ./mini-slurm

build: clean pull infra
	vagrant up

pause:
	vagrant suspend

resume:
	vagrant resume
	sleep 5
	scripts/reDeployUserInfra.sh

deploy:
	scripts/reDeployUserInfra.sh

