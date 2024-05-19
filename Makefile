# Docker Compose commands
up:
	docker-compose up -d

down:
	docker-compose down

restart:
	docker-compose restart

clean:
	docker-compose down --rmi all --volumes --remove-orphans

app:
	docker-compose exec app bash

build-no-cache:
	docker-compose build --no-cache --force-rm

# Database command
db-connect:
	docker-compose exec mysql bash -c 'mysql -u $$DB_USERNAME -p$$DB_PASSWORD $$DB_DATABASE'

# Clear logs command
clear-nginx-logs:
	docker-compose exec nginx bash -c 'echo "" > /var/log/nginx/access.log'
	docker-compose exec nginx bash -c 'echo "" > /var/log/nginx/error.log'

# Laravel setup commands
create-laravel:
	docker-compose run app composer create-project --prefer-dist "laravel/laravel=10.*" .

# Laravel commands
composer-install:
	docker-compose exec app composer install

artisan-key:
	docker-compose exec app php artisan key:generate

migrate:
	docker-compose exec app php artisan migrate

storage-link:
	docker-compose exec app php artisan storage:link

permissions:
	docker-compose exec app chmod -R 777 storage bootstrap/cache

migrate-fresh-seed:
	docker-compose exec app php artisan migrate:fresh --seed

# npm and TailwindCSS setup commands
npm-install:
	docker-compose run --rm app npm install

vue-setup:
	docker-compose run --rm app npm install vue@next vue-loader@next @vue/compiler-sfc typescript --save-dev

tailwind-setup:
	docker-compose run --rm app npm install tailwindcss postcss autoprefixer --save-dev
	docker-compose run --rm app npx tailwindcss init -p

# Combined npm setup
npm-setup: npm-install vue-setup tailwind-setup

# Combined setup command
setup: clean build-no-cache up create-laravel composer-install artisan-key npm-setup storage-link permissions migrate-fresh-seed

# Development commands
npm-dev:
	docker-compose exec app npm run dev

npm-watch:
	docker-compose exec app npm run watch