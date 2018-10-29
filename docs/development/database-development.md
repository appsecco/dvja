# Database Schema

A simple schema consisting of following tables is created:

* users
* products

## Schema Management

MySQL Workbench can be used to created and manage the schema. Once the schema is designed using MySQL workbench, a schema dump can be taken which can be used to created the database schema at runtime:

```
$ mysqldump -u root --no-data dvja > schema.sql
```

MySQL Workbench can be used for debugging and manually editing the database schema during development:

![](/assets/mysql_wb.png)

