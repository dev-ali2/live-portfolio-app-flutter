#automatic deploying of web version to github pages

BASE_HREF = '/'
GITHUB_REPO = https://github.com/dev-ali2/live-portfolio.git
BUILD_VERSION := $(shell grep 'version: ' pubspec.yaml | awk '{print $$2}')
CUSTOM_DOMAIN = portfolio.developerali.com

deploy-web:
	@echo "Cleaning existing repo"
	flutter clean

	@echo "Getting new packages"
	flutter pub get

	@echo "Building web copy"
	flutter build web --release --web-renderer canvaskit --base-href $(BASE_HREF)

	@echo "Creating CNAME file for custom hosting"
	echo "$(CUSTOM_DOMAIN)" > build/web/CNAME

	@echo "Deploying to git repo"
	cd build/web && \
	git init && \
	git add . && \
	git commit -m "Deployment version $(BUILD_VERSION)" && \
	git branch -M main && \
	git remote add origin $(GITHUB_REPO) && \
	git push -u --force origin main

	cd ../..
	@echo "Deploy finished 🤩"

.PHONY: deploy-web