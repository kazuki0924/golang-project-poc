-- migrate:up
CREATE TABLE users
(
  id    INTEGER,
  name  VARCHAR(255),
  email VARCHAR(255) NOT NULL
);

-- migrate:down
DROP TABLE users;
