m3version=1.1.0

.PHONY: all
all: dockerfiles/node/m3dbnode dockerfiles/coordinator/m3coordinator

dockerfiles/node/m3dbnode dockerfiles/coordinator/m3coordinator: m3_$(m3version)_linux_amd64/.extract
	cp m3_$(m3version)_linux_amd64/m3dbnode dockerfiles/node/
	cp m3_$(m3version)_linux_amd64/m3coordinator dockerfiles/coordinator/

m3_$(m3version)_linux_amd64/.extract:
	wget -q https://github.com/m3db/m3/releases/download/v$(m3version)/m3_$(m3version)_linux_amd64.tar.gz
	tar xvf m3_$(m3version)_linux_amd64.tar.gz
	touch m3_$(m3version)_linux_amd64/.extract

.PHONY: clean
clean:
	rm -f m3_$(m3version)_linux_amd64.tar.gz
	rm -rf m3_$(m3version)_linux_amd64
