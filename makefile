.PHONY: build

build:
	@echo "🔹 Очистка старых скриптов..."
	npm run clean:scripts
	rm -rf rawScripts
	@echo "🔹 Проверка папки rawScripts..."
	if [ ! -d rawScripts ]; then mkdir rawScripts; fi
	@echo "🔹 Копирование Lua-скриптов..."
	cp -u lib/commands/*.lua rawScripts/ || echo "Lua скрипты уже скопированы"
	@echo "🔹 Генерация JS-обёрток Lua..."
	npm run transform:commands
	@echo "✅ Сборка завершена"
	npm link
	@echo "✅ Прилинковка"
