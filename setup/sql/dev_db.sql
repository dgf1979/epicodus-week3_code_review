-- Postgres sample template for creating a new database

--switch to user db context
\connect :USER

-- set psql var to new db name
\set db hair_salon
\set db_test hair_salon_test

-- WARNING - these lines will drop the database
DROP DATABASE :db;
DROP DATABASE :db_test;

-- create db
CREATE DATABASE :db;

-- psql - switch to new DB context
\connect :db

-- create tables

CREATE TABLE IF NOT EXISTS clients (
  id SERIAL PRIMARY KEY,
  name varchar(32) DEFAULT NULL,
  stylist_id integer DEFAULT 0
);

CREATE TABLE IF NOT EXISTS stylists (
  id SERIAL PRIMARY KEY,
  name varchar(32) DEFAULT NULL
);

-- create test db from original
CREATE DATABASE :db_test WITH TEMPLATE :db;
