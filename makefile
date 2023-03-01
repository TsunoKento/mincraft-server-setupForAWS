init:
	docker-compose run --rm terraform init
plan:
	docker-compose run --rm terraform plan
apply:
	docker-compose run --rm terraform apply
destroy:
	docker-compose run --rm terraform destroy