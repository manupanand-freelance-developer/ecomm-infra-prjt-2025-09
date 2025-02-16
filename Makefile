dev:
	
	$(info Making dev infrastructure)
	@echo "Makefile execution continues..."
	$(info removing .terraform file)
	rm -rf .terraform
	$(info terraform init dev )
	terraform init -backend-config=env-dev/state.tfvars
	$(info terraform apply dev)
	terraform apply -var-file=env-dev/main.tfvars -auto-approve

prod:
	rm -rf .terraform
	terraform init -backend-config=env-prod/state.tfvars
	terraform apply -var-file=env-prod/main.tfvars -auto-approve

dev-destroy:
	
	terraform destroy -var-file=env-dev/main.tfvars -auto-approve

prod-destroy:

	terraform destroy -var-file=env-prod/main.tfvars -auto-approve