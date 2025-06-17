-- =============================================================
-- Create Database and Schemas (PostgreSQL version)
-- =============================================================
-- WARNING:
-- This will drop the 'datawarehouse' database if it exists.
-- All data will be lost. Use with caution.

-- Connect to the default database to drop 'datawarehouse' if it exists
-- PostgreSQL doesn't allow dropping the current database, so we switch to 'postgres' or another database

\c postgres;

-- Drop database if it exists
DROP DATABASE IF EXISTS datawarehouse;

-- Create the new database
CREATE DATABASE datawarehouse;

-- Connect to the new database
\c datawarehouse;

-- Create schemas
CREATE SCHEMA bronze;
CREATE SCHEMA silver;
CREATE SCHEMA gold;
