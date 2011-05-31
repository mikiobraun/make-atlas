DOWNLOADS=downloads
LAPACK_LITE_VERSION=3.1.1
LAPACK_LITE_TGZ=$(DOWNLOADS)/lapack-lite-$(LAPACK_LITE_VERSION).tgz
LAPACK_LITE_SRC=lapack-lite-$(LAPACK_LITE_VERSION)

download-lapack-lite: $(LAPACK_LITE_TGZ)

unpack-lapack-lite: $(LAPACK_LITE_TGZ)
	tar xzvf $(LAPACK_LITE_TGZ)

compile-lapack-lite: unpack-lapack-lite lib
	./bin/compile-lapack-lite $(LAPACK_LITE_SRC)
	cp $(LAPACK_LITE_SRC)/lapack_LINUX.a lib
	cp $(LAPACK_LITE_SRC)/blas_LINUX.a lib

$(DOWNLOADS):
	mkdir $(DOWNLOADS)

lib:
	mkdir lib

##################################################################
#
# LAPACK
#

$(LAPACK_LITE_TGZ): $(DOWNLOADS)
	(cd $(DOWNLOADS); wget http://www.netlib.org/lapack/lapack-lite-$(LAPACK_LITE_VERSION).tgz)
	touch $(LAPACK_LITE_TGZ)

clean:
	rm -rf $(DOWNLOADS)
	rm -rf $(LAPACK_LITE_SRC)