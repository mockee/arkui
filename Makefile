build:
	@echo "Copy compiled files from arkui project."
	@cp ../arkui/docs/*.html ./arkui.docs/
	@mv ./arkui.docs/base.html ./arkui.docs/index.html
	@echo "[Done] pages"
	@sed -i -e "s/base.html/index.html/g" `grep base\.html -rl ./arkui.docs`
	@find ./arkui.docs -name *.html-e -exec rm -f {} \;
	@echo "[Done] replace text"
	@cp ../arkui/docs/css/arkui.css ./arkui.docs/css/
	@echo "[Done] arkui.css"
	@cp ../arkui/docs/css/docs.css ./arkui.docs/css/
	@sed -i -e "s/\/pics/..\/pics/g" `grep \/pics -rl ./arkui.docs`
	@find ./arkui.docs -name *.css-e -exec rm -f {} \;
	@echo "[Done] docs.css"
	@cp -r ../arkui/pics/ ./arkui.docs/
	@echo "[Done] images"
	@echo "Work It Out!"
