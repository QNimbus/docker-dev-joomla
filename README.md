# Joomla + MySQL + PHPMyAdmin <!-- omit in toc -->

- [About](#about)
- [Usage](#usage)
- [Database tools](#database-tools)
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

## Database tools

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

## Changelog

### [Unreleased] <!-- omit in toc -->

#### Added <!-- omit in toc -->

- Database dump/restore snippets in README
- `.vscode` folder and `settings.json`

#### Changed <!-- omit in toc -->

### [v0.0.1] - 2021-04-29 <!-- omit in toc -->

#### Added <!-- omit in toc -->
- Initial version of `docker-joomla-dev` repository

[v0.0.1]: https://github.com/QNimbus/docker-joomla-dev/releases/tag/v0.0.1
