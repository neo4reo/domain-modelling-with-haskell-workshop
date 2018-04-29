index.html: README.rst Makefile
	pandoc \
		-s \
		--css style.css \
		--toc \
		--mathml \
		--base-header-level=2 \
		-o index.html \
		README.rst
