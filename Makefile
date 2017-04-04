.PHONY: build
build:
	go get ./...
	go build ./...

.PHONY: install
	go get ./...
	go install ./...

.PHONY: clean
clean:
	rm -f docker-machine-driver-xenserver \
		  docker-machine-driver-xenserver_darwin-386.tar.gz \
		  docker-machine-driver-xenserver_darwin-amd64.tar.gz \
		  docker-machine-driver-xenserver_linux-386.tar.gz \
		  docker-machine-driver-xenserver_linux-amd64.tar.gz \
		  docker-machine-driver-xenserver_windows-386.zip \
		  docker-machine-driver-xenserver_windows-amd64.zip

.PHONY: release
release:
	go get ./...
	# Unix
	for arch in 386 amd64 ; do \
		for os in darwin linux ; do \
			GOOS=$$os GOARCH=$$arch go build -o docker-machine-driver-xenserver; \
			tar -cvzf docker-machine-driver-xenserver_$$os-$$arch.tar.gz docker-machine-driver-xenserver; \
			rm -f docker-machine-driver-xenserver; \
		done \
	done
	# Windows
	for arch in 386 amd64 ; do \
		GOOS=windows GOARCH=$$arch go build -o docker-machine-driver-xenserver.exe; \
		zip docker-machine-driver-xenserver_windows-$$arch.zip docker-machine-driver-xenserver.exe; \
		rm -f docker-machine-driver-xenserver; \
	done
