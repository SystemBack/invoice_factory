# laravel-vue-docker-base

This repository provides a Docker-based development environment for Laravel. It includes configurations for PHP, Nginx, MySQL, Node.js, npm, and more. Follow the instructions below to set up your environment.

## Prerequisites

- Docker
- Docker Compose
- Make

## Version Information

- PHP: 8.1.28
- Nginx: 1.18.0
- MySQL: 8.0.32
- Composer: 2.7.6
- Laravel: 10.48.10
- Node.js: 20.13.1
- npm: 10.5.2
- Vue.js: 3.4.27
- TailwindCSS: 3.4.3

## Installation

1. Clone the repository:

    ```sh
    git clone https://github.com/RyunosukeSekido/laravel-vue-docker-base.git
    cd laravel-vue-docker-base
    ```

2. Copy `.env.example` to `.env`:

    ```sh
    cp .env.example .env
    ```

3. Run the setup command:

    ```sh
    make setup
    ```
4. Start Development Environment:  

    ```sh
    make npm-dev
    ```

This will build the Docker containers, install Laravel in the `src` directory, and set up all necessary dependencies.

## Makefile Commands

### Docker Compose Commands

- **Start the containers:**

    ```sh
    make up
    ```

- **Stop the containers:**

    ```sh
    make down
    ```

- **Restart the containers:**

    ```sh
    make restart
    ```

- **Clean the environment:**

    ```sh
    make clean
    ```

- **Access the app container:**

    ```sh
    make app
    ```

- **Rebuild containers without cache:**

    ```sh
    make build-no-cache
    ```

### Database Command

- **Connect to the MySQL database:**

    ```sh
    make db-connect
    ```

## Checking Versions

To check the installed versions of various packages, you can use the following commands inside the Docker containers:

- **PHP:**

    ```sh
    docker-compose exec app php -v
    ```

- **Nginx:**

    ```sh
    docker-compose exec nginx nginx -v
    ```

- **MySQL:**

    ```sh
    docker-compose exec mysql mysql -V
    ```

- **Composer:**

    ```sh
    docker-compose exec app composer --version
    ```

- **Node.js:**

    ```sh
    docker-compose exec app node -v
    ```

- **npm:**

    ```sh
    docker-compose exec app npm -v
    ```

- **Vue.js:**

    ```sh
    docker-compose exec app npm list vue
    ```

- **TailwindCSS:**

    ```sh
    docker-compose exec app npm list tailwindcss
    ```
