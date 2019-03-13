install: pharo

pharo pharo-ui:
	wget -O- https://get.pharo.org/64 | bash 

run-hello-world: pharo
	./pharo HelloWorld.image --quit st hello.st

inspect-hello-world: pharo-ui
	./pharo-ui HelloWorld.image

clean:
	rm -rf Pharo.changes Pharo.image Pharo7.0-32bit-890f474.sources pharo pharo-ui pharo-vm pharo-local
