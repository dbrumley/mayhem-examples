IMAGE=`mayhem docker-registry`/dbrumley/ada
all:
	docker build -t ${IMAGE} -f Dockerfile .
	docker push ${IMAGE}:latest
