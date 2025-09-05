.PHONY: build

build:
	@echo "🔹 clean proc..."
	npm run clean:scripts
	rm -rf rawScripts
	@echo "🔹 check dir rawScripts..."
	if [ ! -d rawScripts ]; then mkdir rawScripts; fi
	@echo "🔹 copy Lua..."
	npm run generate:raw:scripts
	@echo "🔹 Generate JS Lua..."
	npm run transform:commands
	@echo "✅ Build success"
	npm link
	@echo "✅ Link"
