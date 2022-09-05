CREATE ROLE local_dev login password 'postgres';
CREATE DATABASE local_dev;
GRANT ALL PRIVILEGES ON DATABASE local_dev TO local_dev;
