CREATE DATABASE lw11;

USE lw11;

CREATE TABLE user
(
    id              INT AUTO_INCREMENT NOT NULL,
    name            VARCHAR(255)       NOT NULL,
    email           VARCHAR(255)       NOT NULL,
    country         VARCHAR(255)       NOT NULL,
    gender          VARCHAR(255)       NOT NULL,
    message         TEXT               NOT NULL,
    PRIMARY KEY (id)
) DEFAULT CHARACTER SET utf8mb4
  COLLATE 'utf8mb4_unicode_ci'
  ENGINE = InnoDB;
