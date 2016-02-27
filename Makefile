
default:
	grpc-compile --xdr --constants < input.x > types.scm
	grpc-compile --client < input.x > client.scm
	grpc-compile --server < input.x > server.scm

install:
	tar zxvf guile-rpc-0.4.tar.gz
	cd guile-rpc-0.4; ./configure --prefix=/usr; make; sudo make install



