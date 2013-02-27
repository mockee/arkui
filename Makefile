build:
	@echo "Copy compiled files from arkui project."
	@cp ../arkui/docs/*.html .
	@mv ./arkui.docs/base.html ./index.html
	@echo "[Done] pages"
	@sed -i -e "s/base.html/\//g" `grep base\.html -rl .`
	@find . -name *.html-e -exec rm -f {} \;
	@echo "[Done] replace text"
	@cp ../arkui/docs/css/arkui.css ./css/
	@echo "[Done] arkui.css"
	@cp ../arkui/docs/css/docs.css .
	@sed -i -e "s/\/pics/..\/pics/g" `grep \/pics -rl .`
	@find . -name *.css-e -exec rm -f {} \;
	@echo "[Done] docs.css"
	@cp -r ../arkui/pics .
	@echo "[Done] images"
	@echo "Work It Out!"
