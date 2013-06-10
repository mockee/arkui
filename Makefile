build:
	@echo "Copy compiled files from arkui project."
	@cp ../arkui/docs/*.html .
	@mv ./base.html ./index.html
	@echo "[Done] pages"
	@cp ../arkui/docs/css/arkui.css ./css/
	@echo "[Done] arkui.css"
	@sed -i -e "s/base.html/\//g" `grep base\.html -rl *.html`
	@sed -i -e "s/\/pics/..\/pics/g" `grep \/pics -rl ./css/arkui.css`
	@rm *.html-e css/*.css-e
	@cp ../arkui/docs/css/docs.css ./css/
	@echo "[Done] docs.css"
	@cp -r ../arkui/pics .
	@echo "[Done] images"
	@echo "Work It Out!"
