.PHONY: monitoring consul all api cache facebox ingress website

all: consul api cache facebox ingress website monitoring

api:
	docker build -f emojify-api/Dockerfile -t eveld/emojify-api:v0.7.4 .
	docker push eveld/emojify-api:v0.7.4

cache:
	docker build -f emojify-cache/Dockerfile -t eveld/emojify-cache:v0.4.3 .
	docker push eveld/emojify-cache:v0.4.3	

facebox:
	docker build -f emojify-facebox/Dockerfile -t eveld/emojify-facedetection:v0.10.0 .
	docker push eveld/emojify-facedetection:v0.10.0	

ingress:
	docker build -f emojify-ingress/Dockerfile -t eveld/emojify-ingress:v0.0.1 .
	docker push eveld/emojify-ingress:v0.0.1	

website:
	docker build -f emojify-website/Dockerfile -t eveld/emojify-website:v0.7.0 .
	docker push eveld/emojify-website:v0.7.0

consul:
	docker build -f consul-server/Dockerfile -t eveld/consul:v1.4.4-dev .
	docker push eveld/consul:v1.4.4-dev

monitoring:
	docker build -f monitoring/Dockerfile -t eveld/monitoring:v0.1.0 .
	docker push eveld/monitoring:v0.1.0