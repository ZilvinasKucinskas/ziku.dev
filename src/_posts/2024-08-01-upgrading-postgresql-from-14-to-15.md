---
title: "How to upgrade PostgreSQL from 14 to 15 with brew?"
description: "Using pg_upgrade to upgrade PostgreSQL from 14 to 15 with brew."
tags:
  - postgresql
categories: tech
date: "2023-08-01 16:08:20.298766 UTC"
last_modified_at: "2023-08-01 16:08:20.298766 UTC"
---

I was struggling figuring out how to upgrade the Postgresql with brew on my machine, so I compiled my learnings. Here is a quick tutorial.

## Install postgresql@15

Make sure you have both [postgresql@14](https://formulae.brew.sh/formula/postgresql@14) and [postgresql@15](https://formulae.brew.sh/formula/postgresql@15) installed.


```bash
brew search postgres
brew install postgresql@15
```

## Fix executables

`postgresql@15` is keg-only, which means it was not symlinked into `/opt/homebrew`.

Let's put it into our path:

```bash
echo 'export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

## Stop running services

Stop PostgreSQL services from running:

```bash
brew services list
brew services stop postgresql@14
brew services stop postgresql@15
```

## Migrate the data

Use `pg_upgrade` executable to migrate the data.

```bash
pg_upgrade \
  -d /opt/homebrew/var/postgresql@14 \
  -D /opt/homebrew/var/postgresql@15 \
  -b /opt/homebrew/opt/postgresql@14/bin/ \
  -B /opt/homebrew/opt/postgresql@15/bin/
```

**Note:** data migration might fail due to locale issues.

The error would look like:

```bash
FATAL:  postmaster became multithreaded during startup
HINT:  Set the LC_ALL environment variable to a valid locale.
```

To fix it, run:

```bash
echo 'export LC_ALL="en_US.UTF-8"' >> ~/.zshrc
source ~/.zshrc
```

## Delete Old data

Delete the old cluster data files:

```bash
./delete_old_cluster.sh
```

## Remove PostgreSQL 14

Hopefully, everything went smooth up to this point and we can go ahead and uninstall the old Postgres.

```bash
brew uninstall postgresql@14
```

We are done!
