build:
	@echo "Copy compiled files from arkui project."
	@cp ../arkui/docs/*.html .
	@mv ./base.html ./index.html
	@echo "[Done] pages"
	@sed -i -e "s/base.html/\//g" `grep base\.html -rl index.html`
	@find . -name *.html-e -exec rm -f {} \;
	@echo "[Done] replace text"
	@cp ../arkui/docs/css/arkui.css ./css/
	@echo "[Done] arkui.css"
	@cp ../arkui/docs/css/docs.css ./css/
	@echo "[Done] docs.css"
	@cp -r ../arkui/pics .
	@echo "[Done] images"
	@echo "Work It Out!"
