/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;

SET NAMES 'utf8';
CREATE DATABASE railway_tiurina_k_r;
USE railway_tiurina_k_r;

--
-- Описание для таблицы users
--
CREATE TABLE users(
  id INT (11) NOT NULL AUTO_INCREMENT,
  email VARCHAR (20) NOT NULL,
  last_name VARCHAR (20) DEFAULT NULL,
  name VARCHAR (20) DEFAULT NULL,
  second_name VARCHAR (45) DEFAULT NULL,
  phone VARCHAR (45) DEFAULT NULL,
  password VARCHAR (45) DEFAULT NULL,
  role VARCHAR (20) DEFAULT 'USER',
  PRIMARY KEY (id),
  UNIQUE INDEX id_UNIQUE USING BTREE (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 3
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы trains
--
CREATE TABLE trains(
  id INT (11) NOT NULL AUTO_INCREMENT,
  train_type VARCHAR (50) NOT NULL,
  number_of_seats VARCHAR (50) NOT NULL,
  price_per_stop FLOAT(11) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE INDEX id_UNIQUE USING BTREE (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 41
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы ways
--
CREATE TABLE ways(
  id INT (11) NOT NULL AUTO_INCREMENT,
  way_number INT (11) NOT NULL,
  stops_array ARRAY (45) NOT NULL,
  train_id INT (11) NOT NULL,
  departure DATETIME NOT NULL,
  arrival DATETIME NOT NULL,
  PRIMARY KEY (id),
  UNIQUE INDEX id_UNIQUE USING BTREE (id),
  FOREIGN KEY (train_id) REFERENCES trains(id)
)
ENGINE = INNODB
AUTO_INCREMENT = 14
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы tickets
--
CREATE TABLE tickets(
  id INT (11) NOT NULL AUTO_INCREMENT,
  way_id INT (11) NOT NULL,
  user_id INT (11) NOT NULL,
  end_stop VARCHAR (45) NOT NULL,
  price FLOAT (11) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE INDEX id_UNIQUE USING BTREE (id),
  FOREIGN KEY (way_id) REFERENCES ways(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
)
ENGINE = INNODB
AUTO_INCREMENT = 14
CHARACTER SET utf8
COLLATE utf8_general_ci;

/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
