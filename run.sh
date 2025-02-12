if [$# -ne 2]; then
    echo $0 env(dev|prod) actionn(apply|destroy)
    exit 1
fi
rm -rf .terraform
terraform init -backend-config=env-${1}/state.tfvars
terraform $2 -var-file=env-${1}/main.tfvars -auto-approve