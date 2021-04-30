# Joomla + MySQL + PHPMyAdmin <!-- omit in toc -->

- [About](#about)
- [Usage](#usage)
- [Database](#database)
- [Notes](#notes)
  - [Docker for Windows using WSL2](#docker-for-windows-using-wsl2)
- [Changelog](#changelog)

Simple `docker-compose` development stack for Joomla, MySQL & PHPMyAdmin.

## About

TODO

## Usage

To start the Docker stack using `docker-compose`:

```bash
# To start in background (use --detach or -d)
$ docker-compose up --detach 

# To start in foreground
$ docker-compose up
```

To stop the Docker stack using `docker-compose`:

```bash
$ docker-compose down
```

## Database

Dump Joomla database to file:

```bash
$ docker exec mysql mysqldump --user root --password=mysql joomla > /var/lib/mysql/joomla.db.sql

# Note: when using Git Bash on Windows use the command below:
$ docker exec mysql //bin/bash -c "mysqldump --user root --password=mysql --databases joomla --add-drop-database > /var/lib/mysql/joomla.db.sql"
```

Import Joomla database from file:

```bash
$ docker exec -i mysql mysql --user root --password=mysql < /var/lib/mysql/joomla.db.sql

# Note: when using Git Bash on Windows use the command below:
$ docker exec -i mysql //bin/bash -c "mysql --user root --password=mysql < /var/lib/mysql/joomla.db.sql"
```

## Notes

### Docker for Windows using WSL2

See: [Docker Desktop WSL 2 backend - Best practices](https://docs.docker.com/docker-for-windows/wsl/#best-practices)

To get the best out of the file system performance when bind-mounting files, we recommend storing source code and other data that is bind-mounted into Linux containers (i.e., with docker run -v <host-path>:<container-path>) in the Linux file system, rather than the Windows file system. You can also refer to the [recommendation](https://docs.microsoft.com/en-us/windows/wsl/compare-versions) from Microsoft.

## Changelog

### [Unreleased] <!-- omit in toc -->

### [v0.0.2] - 2021-04-30 <!-- omit in toc -->

#### Added <!-- omit in toc -->

- Database dump/restore snippets in README
- `.vscode` folder and `settings.json`
- Added `Notes` section in README

#### Changed <!-- omit in toc -->

- Made volume config in `docker-compose.yaml` more verbose

### [v0.0.1] - 2021-04-29 <!-- omit in toc -->

#### Added <!-- omit in toc -->
- Initial version of `docker-joomla-dev` repository

[Unreleased]: https://github.com/QNimbus/docker-joomla-dev/compare/v0.0.2...HEAD
[v0.0.2]: https://github.com/QNimbus/docker-joomla-dev/releases/tag/v0.0.2
[v0.0.1]: https://github.com/QNimbus/docker-joomla-dev/releases/tag/v0.0.1
