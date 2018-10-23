TERRAFORM_VERSION := 0.11.9
-include terraform.mk

.terraform.mk:
	curl -sSL https://raw.githubusercontent.com/tmknom/template-terraform-module/master/terraform.mk -o .terraform.mk

MINIMAL_DIR := ./examples/minimal
COMPLETE_DIR := ./examples/complete

terraform-plan-minimal: ## Run terraform plan examples/minimal
	$(call terraform,${MINIMAL_DIR},init)
	$(call terraform,${MINIMAL_DIR},plan) | tee -a /dev/stderr | docker run --rm -i tmknom/terraform-landscape

terraform-apply-minimal: ## Run terraform apply examples/minimal
	$(call terraform,${MINIMAL_DIR},apply)

terraform-destroy-minimal: ## Run terraform destroy examples/minimal
	$(call terraform,${MINIMAL_DIR},destroy)

terraform-plan-complete: ## Run terraform plan examples/complete
	$(call terraform,${COMPLETE_DIR},init)
	$(call terraform,${COMPLETE_DIR},plan) | tee -a /dev/stderr | docker run --rm -i tmknom/terraform-landscape

terraform-apply-complete: ## Run terraform apply examples/complete
	$(call terraform,${COMPLETE_DIR},apply)

terraform-destroy-complete: ## Run terraform destroy examples/complete
	$(call terraform,${COMPLETE_DIR},destroy)
