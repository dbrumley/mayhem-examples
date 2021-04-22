REGISTRY = `mayhem docker-registry`/dbrumley/lighttpd

all: build registries

build:
	docker build -t lighttpd:vulnerable -f Dockerfile.vulnerable .
	docker build -t lighttpd:fixed -f Dockerfile.fixed .
	docker tag lighttpd:fixed lighttpd:latest

registries: 
	docker tag lighttpd:vulnerable dbrumley/lighttpd:vulnerable
	docker tag lighttpd:fixed dbrumley/lighttpd:fixed
	docker tag lighttpd:latest dbrumley/lighttpd:latest
	docker push dbrumley/lighttpd:vulnerable
	docker push dbrumley/lighttpd:fixed
	docker push dbrumley/lighttpd:latest 
	
	# Yes, this isn't DRY. But I spent 30m fighting make
	# and it's not worth it.
	docker tag lighttpd:vulnerable $(REGISTRY):vulnerable
	docker tag lighttpd:fixed $(REGISTRY):fixed
	docker tag lighttpd:latest $(REGISTRY):latest
	docker push $(REGISTRY):vulnerable
	docker push $(REGISTRY):fixed
	docker push $(REGISTRY):latest 
