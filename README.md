# Joomla + MySQL + PHPMyAdmin <!-- omit in toc -->

- [About](#about)
- [Usage](#usage)
  - [VSCode (devcontainer)](#vscode-devcontainer)
  - [Standalone (docker-compose)](#standalone-docker-compose)
- [Getting started](#getting-started)
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

## Useful commands

### Database

To dump Joomla database to a file:

```bash
$ docker exec mysql mysqldump --user root --password=mysql joomla > /var/lib/mysql/joomla.db.sql

# Note: when using Git Bash on Windows use the command below:
$ docker exec mysql //bin/bash -c "mysqldump --user root --password=mysql --databases joomla --add-drop-database > /var/lib/mysql/joomla.db.sql"
```

To import Joomla database from a file:

```bash
$ docker exec -i mysql mysql --user root --password=mysql < /var/lib/mysql/joomla.db.sql

# Note: when using Git Bash on Windows use the command below:
$ docker exec -i mysql //bin/bash -c "mysql --user root --password=mysql < /var/lib/mysql/joomla.db.sql"
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

#### Changed <!-- omit in toc -->

- Renamed container names in `docker-compose` file
- Removed obsolete `volumes` section from `docker-compose` file
- Minor corrections and additions to README
- Commented out `dev`/`workspace` volume mount since VSCode takes care of this

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
