# Very Very simple makefile

PREFIX=/usr/local

install:
	@echo "Installing..."
	@install llm $(PREFIX)/bin/
	@(echo 2; echo a; echo "prefix=$(PREFIX)"; echo .; echo wq) | ed $(PREFIX)/bin/llm > /dev/null
	@mkdir -p $(PREFIX)/lib/llm/
	@install ./backends/* $(PREFIX)/lib/llm/
	@echo "Done!"

uninstall:
	# get all files in ./scripts and remove them from /usr/local/bin
	@echo "Uninstalling..."
	@find ./scripts -type f -name "*" -exec rm -f $(PREFIX)/bin/{} \;
	@rm -rf $(PREFIX)/lib/llm/
	@echo "Done!"

