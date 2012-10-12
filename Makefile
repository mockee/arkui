PATH_DOCS = ./docs
PATH_CSS = ./docs/css
PATH_TMPL = ./docs/templates
PATH_STYLUS = ./stylus

DATE = $(shell date +%I:%M%p) 

build:
	@echo "Building Arkui Docs..."
	@node docs/build
	@stylus ${PATH_STYLUS}/arkui.styl -c -o ${PATH_CSS}
	@stylus ${PATH_CSS}/docs.styl -c -o ${PATH_CSS}
	@echo "Arkui Docs successfully built at ${DATE}."
	@open ${PATH_DOCS}/base.html

clear_docs:
	@rm ${PATH_CSS}/*.css
	@rm ${PATH_DOCS}/*.html
	@echo "Done!"

watch_jade:
	@jade -w ${PATH_TMPL}/pages -O ./docs

watch_stylus:
	@stylus -w ${PATH_STYLUS} -o ${PATH_CSS}
