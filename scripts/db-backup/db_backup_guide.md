### On `pg_dump`

`pg_dump` is a PostgreSQL utility that allows you to create a backup (dump) of a database. It’s a versatile tool that can generate plain SQL scripts or custom archive formats for backups.

#### 1. **Basic Syntax**
```bash
pg_dump [options] dbname
```
- `dbname`: The name of the PostgreSQL database you want to back up.

#### 2. **Commonly Used Options**
Here are the most commonly used options with `pg_dump`:

| Option           | Description                                                                                        |
|------------------|----------------------------------------------------------------------------------------------------|
| `-U username`    | Specifies the PostgreSQL user to connect as.                                                        |
| `-h host`        | Specifies the host of the PostgreSQL server (default is `localhost`).                               |
| `-p port`        | Specifies the port number of the PostgreSQL server (default is `5432`).                             |
| `-F format`      | Specifies the output file format. Can be `p` (plain text), `c` (custom), `d` (directory), `t` (tar).|
| `-f file`        | Output the dump to a specified file (instead of stdout).                                            |
| `-t table`       | Dump only a specific table.                                                                         |
| `-s`             | Dump only the schema (structure), without data.                                                     |
| `-a`             | Dump only the data, without schema.                                                                 |
| `--clean`        | Include SQL commands to clean (drop) existing objects before recreating them.                       |
| `--if-exists`    | Add `IF EXISTS` clauses to `DROP` statements to avoid errors if the object doesn't exist.           |
| `-C`             | Include `CREATE DATABASE` in the dump file.                                                         |
| `-n schema`      | Dump only objects belonging to a specific schema.                                                   |
| `-v`             | Verbose mode, gives more output information.                                                        |

---

#### 3. **Dump Formats**
`pg_dump` can generate backups in different formats:

- **Plain text format (`-F p`)**: 
   - Generates a human-readable SQL script.
   - You can restore it manually or using `psql`.
   - **Example**:
     ```bash
     pg_dump -U user -F p mydb > mydb_backup.sql
     ```

- **Custom format (`-F c`)**:
   - This format is compressed and cannot be read directly.
   - To restore, you must use `pg_restore`.
   - **Example**:
     ```bash
     pg_dump -U user -F c mydb -f mydb_backup.dump
     ```

- **Directory format (`-F d`)**:
   - Dumps the database into multiple files, each representing a part of the database.
   - Good for large databases.
   - **Example**:
     ```bash
     pg_dump -U user -F d mydb -f /path/to/dump_directory/
     ```

- **Tar format (`-F t`)**:
   - Dumps the database into a tarball.
   - Restored using `pg_restore`.
   - **Example**:
     ```bash
     pg_dump -U user -F t mydb -f mydb_backup.tar
     ```

---

#### 4. **Full Example**

##### Basic backup (plain SQL format):
```bash
pg_dump -U username -h localhost -d mydatabase -f backup.sql
```
This command creates a plain SQL dump of `mydatabase`, saved as `backup.sql`.

##### Custom format backup:
```bash
pg_dump -U username -h localhost -d mydatabase -F c -f backup.custom
```
This creates a backup in custom format, saved as `backup.custom`.

---

#### 5. **Restoring a Backup**
- **Plain SQL file**: 
   - Use `psql` to restore:
     ```bash
     psql -U username -d newdatabase -f backup.sql
     ```

- **Custom, Directory, or Tar Format**:
   - Use `pg_restore` to restore:
     ```bash
     pg_restore -U username -d newdatabase backup.custom
     ```

---

### Content of a database backup file

The content of a backup file created using `pg_dump` depends on the format you use. Here's what to expect for some common formats:

### 1. **Plain Text Format (`-F p`)**:
A plain text backup contains SQL statements that can be executed directly by `psql` to recreate the database, including schema definitions and data inserts.

Example of the content of a **plain SQL** backup file:

```sql
-- PostgreSQL database dump
--
-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: mydatabase; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE mydatabase WITH TEMPLATE = template0 ENCODING = 'UTF8';

\connect mydatabase

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (id, username, email, created_at) VALUES
(1, 'johndoe', 'john@example.com', '2024-09-18 12:34:56+00'),
(2, 'janedoe', 'jane@example.com', '2024-09-18 13:34:56+00');

--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES public.users(id),
    amount DECIMAL(10, 2),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders (id, user_id, amount, created_at) VALUES
(1, 1, 100.50, '2024-09-18 14:00:00+00'),
(2, 2, 200.75, '2024-09-18 15:00:00+00');

-- 
-- PostgreSQL database dump complete
--
```

### 2. **Custom Format (`-F c`)**:
The custom format is a binary format and cannot be read directly like a plain text file. Instead, you would use `pg_restore` to interpret and restore it.

You will not see human-readable SQL in the custom format file, but when restoring using `pg_restore`, you will see output similar to what’s in the plain text format.

### 3. **Directory Format (`-F d`)**:
In directory format, the backup is stored across multiple files within a directory. This format allows parallel restoration of large databases.

- Example directory structure:
  ```
  dumpdir/
    toc.dat       # Table of contents for the dump
    123.dat       # Data for some specific table or object
    124.dat       # Data for another table or object
    123.desc      # Description of the object in the dump
    ...
  ```

These files aren't human-readable, and you would need `pg_restore` to extract and restore them.

### 4. **Tar Format (`-F t`)**:
A tar format backup file is similar to the custom format but packaged as a tar archive. You cannot view its content directly (without extracting), and you would restore it with `pg_restore`. The tar file contains binary data.

---

### **How to Read a Backup**
For **plain text** backups, you can simply open the file with any text editor or view it using the `cat` command:

```bash
cat mydatabase_backup.sql
```

For **custom** or **tar** format backups, use `pg_restore` to read the file:

```bash
pg_restore -l mydatabase_backup.dump  # List the content
pg_restore -d mydatabase mydatabase_backup.dump  # Restore the database
```