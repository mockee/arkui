PATH_DOCS = ./docs
PATH_CSS = ./docs/css
PATH_TMPL = ./docs/templates
PATH_STYLUS = ./stylus

DATE = $(shell date +%I:%M%p) 

build:
	@echo "Building Arkui Docs..."
	@node docs/build
	@stylus ${PATH_STYLUS}/index.styl -c -o ${PATH_CSS}
	@mv ${PATH_CSS}/index.css ${PATH_CSS}/arkui.css
	@stylus ${PATH_CSS}/docs.styl -c -o ${PATH_CSS}
	@echo "Arkui Docs successfully built at ${DATE}."

clear_docs:
	@rm ${PATH_CSS}/*.css
	@rm ${PATH_DOCS}/*.html
	@echo "Done!"

watch_jade:
	@jade -w ${PATH_TMPL}/pages -O ./docs

watch_stylus:
	@stylus -w ${PATH_STYLUS} -o ${PATH_CSS}
