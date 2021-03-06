# Joomla + MySQL + PHPMyAdmin <!-- omit in toc -->

- [About](#about)
- [Usage](#usage)
  - [VSCode (devcontainer)](#vscode-devcontainer)
  - [Standalone (docker-compose)](#standalone-docker-compose)
- [Getting started](#getting-started)
- [Skipping manual configuration](#skipping-manual-configuration)
- [Useful commands](#useful-commands)
  - [Database](#database)
- [Notes](#notes)
  - [Docker for Windows using WSL2](#docker-for-windows-using-wsl2)
- [Changelog](#changelog)

Simple `docker-compose` development stack for Joomla, MySQL & PHPMyAdmin.

## About

Joomla, MySQL and phpMyAdmin development container for use with Microsoft `VSCode` (or standalone, if desired). PHP XDebug is enabled for easy debugging within `VSCode`. The development container configuration for `vscode` includes the `felixfbecker.php-debug` PHP debug extension to work with PHP XDebug inside the container.

## Usage

### VSCode (devcontainer)

*Prerequisites: Ensure the [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension is installed in VSCode (part of [Remote development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack) extension pack)*

Open the VSCode Command Palette using `Ctrl-Shift-P` on Windows or `Command-Shift-P` on MacOS. From the VSCode command palette execute the `Remote-Containers: Reopen in Container` command.

The `Remote - Containers` commands are also available in the bottom left corner of the VSCode editor window in the status bar as shown the image below.

![VSCode status bar](https://code.visualstudio.com/assets/docs/remote/wsl-tutorial/remote-status-bar.png)

### Standalone (docker-compose)

To start the Docker stack using `docker-compose`:

```bash
# To start in background (use --detach or -d)
$ docker-compose up --detach 

# To start in foreground
$ docker-compose up
```

To stop the Docker stack using `docker-compose`:

```bash
# To stop
$ docker-compose down
```

To view log output of the running containers:

```bash
# Last 10 lines of running containers
$ docker-compose logs --tail=10

# Continuous log output of running containers
$ docker-compose logs --tail=10 --follow

# Continuous log output of specific container, e.g. 'joomla'
$ docker-compose logs --tail=10 --follow joomla
```

## Getting started

After starting de Docker stack using the `docker-compose` command from the [usage](#usage) section you will have 3 Docker containers running. You can view the running containers by running:

```bash
# Using docker-compose
$ docker-compose ps

# Alternatively, using docker
$ docker ps -f "name=joomla"
```

You will see something like this:

```bash
      Name                     Command               State          Ports
---------------------------------------------------------------------------------
joomla              /entrypoint.sh apache2-for ...   Up      0.0.0.0:80->80/tcp
joomla_mysql        docker-entrypoint.sh mysqld      Up      3306/tcp, 33060/tcp
joomla_phpmyadmin   /docker-entrypoint.sh apac ...   Up      0.0.0.0:8080->80/tcp
```

This means you can point your browser to [localhost](http://localhost:80) and you should see your Joomla instance. When you do this for the first time you will need to perform some basic configuration for Joomla. (e.g. database connection settings, admin user, et cetera)

In the second setup section you need to enter the database connection settings. For the database host name you need to use `db` since that is the hostname of the Docker MySQL container. The username and password for the MySQL instance are `root` and `mysql` (see: [docker-compose.yaml](docker-compose.yaml))

## Skipping manual configuration

You can skip the initial manual configuration of Joomla! by running the `install.sh` script from the command line on the Docker host. This script copies a default `configuration.php` file to the Joomla! root folder, initializes the MySQL database for use with Joomla! and removes the Joomla! installation folder. The default admin user and password will become `admin:admin`.

```bash
$ ./install.sh
```

## Useful commands

### Database

To dump Joomla database to a file:

```bash
$ docker exec joomla_mysql mysqldump --user root --password=mysql joomla > /var/lib/mysql/joomla.db.sql

# Note: when using Git Bash on Windows use the command below:
$ docker exec joomla_mysql //bin/bash -c "mysqldump --user root --password=mysql --databases joomla --add-drop-database > /var/lib/mysql/joomla.db.sql"
```

To import Joomla database from a file:

```bash
$ docker exec -i joomla_mysql mysql --user root --password=mysql < /var/lib/mysql/joomla.db.sql

# Note: when using Git Bash on Windows use the command below:
$ docker exec -i joomla_mysql //bin/bash -c "mysql --user root --password=mysql < /var/lib/mysql/joomla.db.sql"
```

## Notes

### Docker for Windows using WSL2

See: [Docker Desktop WSL 2 backend - Best practices](https://docs.docker.com/docker-for-windows/wsl/#best-practices)

To get the best out of the file system performance when bind-mounting files, we recommend storing source code and other data that is bind-mounted into Linux containers (i.e., with `docker run -v <host-path>:<container-path>`) in the Linux file system, rather than the Windows file system. You can also refer to the [recommendation](https://docs.microsoft.com/en-us/windows/wsl/compare-versions) from Microsoft.

## Changelog

### [Unreleased] <!-- omit in toc -->

#### Added <!-- omit in toc -->

- Added `Getting started` section to README
- Added `Useful commands` section to README
- Added `Usage` section to README
- ~~Added `dev` bind mount volume to `docker-compose` for Joomla development~~
- Added empty `dev` folder to repository
- Added vscode `.devcontainer` files
- Added vscode `launch.json` file for debug configuration
- Added PHP `xdebug` installation and configuration to container
- Added `pathMappings` config to `launch.json` for debugging source code
- Added several VSCode extensions for PHP and Joomla development to the devcontainer
- Added PHP Composer and PHP CodeSniffer to devcontainer
- Added `.editorconfig` to enforce Joomla development coding style standards
- Added `install.sh` script to install default Joomla database and sample blog content

#### Changed <!-- omit in toc -->

- Renamed container names in `docker-compose` file
- Removed obsolete `volumes` section from `docker-compose` file
- Minor corrections and additions to README
- Commented out `dev`/`workspace` volume mount since VSCode takes care of this
- Modified MySQL bound volume to a named volume
- Removed `Launch currently open script` from `launch.json`

### [v0.0.2] - 2021-04-30 <!-- omit in toc -->

#### Added <!-- omit in toc -->

- Database dump/restore snippets in README
- `.vscode` folder and `settings.json`
- Added `Notes` section in README

#### Changed <!-- omit in toc -->

- Made volume config in `docker-compose.yaml` more verbose

### [v0.0.1] - 2021-04-29 <!-- omit in toc -->

#### Added <!-- omit in toc -->
- Initial version of `docker-dev-joomla` repository

[Unreleased]: https://github.com/QNimbus/docker-dev-joomla/compare/v0.0.2...HEAD
[v0.0.2]: https://github.com/QNimbus/docker-dev-joomla/releases/tag/v0.0.2
[v0.0.1]: https://github.com/QNimbus/docker-dev-joomla/releases/tag/v0.0.1
