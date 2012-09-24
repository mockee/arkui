PATH_CSS = ./docs/css
PATH_STYLUS = ./stylus/
PATH_TMPL = ./docs/templates
ARKUI_STYLUS = ./stylus/arkui.styl

DATE = $(shell date +%I:%M%p) 

build:
	@echo "Building Arkui..."
	@node docs/build
	@stylus ${ARKUI_STYLUS} -c -o ${PATH_CSS}
	@echo "Arkui successfully built at ${DATE}."

watch_jade:
	@jade -w ${PATH_TMPL}/pages -O ./docs

watch_stylus:
	@stylus -w ${PATH_STYLUS} -o ${PATH_CSS}
