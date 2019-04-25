.PHONY: consul all api cache facebox ingress website

all: consul api cache facebox ingress website

api:
	docker build -f Dockerfile.api -t eveld/emojify-api:v0.7.4 .
	docker push eveld/emojify-api:v0.7.4``	

cache:
	docker build -f Dockerfile.cache -t eveld/emojify-cache:v0.4.3 .
	docker push eveld/emojify-cache:v0.4.3	

facebox:
	docker build -f Dockerfile.facebox -t eveld/emojify-facedetection:v0.10.0 .
	docker push eveld/emojify-facedetection:v0.10.0	

ingress:
	docker build -f Dockerfile.ingress -t eveld/emojify-ingress:v0.0.1 .
	docker push eveld/emojify-ingress:v0.0.1	

website:
	docker build -f Dockerfile.website -t eveld/emojify-website:v0.7.0 .
	docker push eveld/emojify-website:v0.7.0

consul:
	docker build -f Dockerfile.consul -t eveld/consul:v1.4.4-dev .
	docker push eveld/consul:v1.4.4-dev