.PHONY: build
build:
	go get ./...
	go build ./...

.PHONY: install
	go get ./...
	go install ./...

.PHONY: clean
clean:
	if [ -f docker-machine-driver-xenserver ] ; then rm docker-machine-driver-xenserver ; fi
	for arch in 386 amd64 ; do \
		for os in darwin linux ; do \
			if [ -f docker-machine-driver-xenserver_$$os-$$arch ] ; then rm docker-machine-driver-xenserver_$$os-$$arch ; fi ; \
		done \
	done

.PHONY: release
release:
	go get ./...
	for arch in 386 amd64 ; do \
		for os in darwin linux ; do \
			GOOS=$$os GOARCH=$$arch go build -o docker-machine-driver-xenserver_$$os-$$arch ; \
		done \
	done
