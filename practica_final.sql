-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema practicafinal
-- -----------------------------------------------------
-- CREATE SCHEMA IF NOT EXISTS `practicafinal` DEFAULT CHARACTER SET utf8 ;
-- USE `practicafinal` ;

DROP DATABASE IF EXISTS `practicafinal`;
CREATE DATABASE `practicafinal` CHARACTER SET utf8;
USE `practicafinal`;

-- -----------------------------------------------------
-- Table `practicafinal`.`Proveidor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practicafinal`.`Proveidor` (
  `id_proveidor` INT NOT NULL AUTO_INCREMENT,
  `marca` VARCHAR(45) NOT NULL, 
  `nom` VARCHAR(45) NOT NULL,
  `telefon` INT NOT NULL,
  `fax` INT NOT NULL,
  `nif` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_proveidor`),
  UNIQUE INDEX `marca_UNIQUE` (`marca` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelatgeBBDD`.`AdreçaProveidor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practicafinal`.`AdreçaProveidor` (
  `proveidor_id` INT NOT NULL,
  `carrer` VARCHAR(45) NULL,
  `numero` INT NULL,
  `pis` INT NULL,
  `porta` VARCHAR(45) NULL DEFAULT '',
  `ciutat` VARCHAR(45) NULL,
  `codi_postal` INT NULL,
  `pais` VARCHAR(45) NULL,
  PRIMARY KEY (`proveidor_id`),
  INDEX `proveidor_id_idx` (`proveidor_id` ASC),
  CONSTRAINT `proveidor_id`
    FOREIGN KEY (`proveidor_id`)
    REFERENCES `practicafinal`.`Proveidor` (`id_proveidor`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `practicafinal`.`Muntura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practicafinal`.`Muntura` (
  `id_muntura` INT NOT NULL AUTO_INCREMENT,
  `tipu` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_muntura`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `practicafinal`.`Clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practicafinal`.`Clients` (
  `id_client` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `adreça` VARCHAR(45) NOT NULL,
  `telefon` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `data_registre` DATE NOT NULL,
  `client_recomanat` VARCHAR(45) NULL,
  `empleat_venta` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_client`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `practicafinal`.`Ulleres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practicafinal`.`Ulleres` (
  `id_ulleres` INT NOT NULL AUTO_INCREMENT,
  `proveidor_ulleres_id` INT NOT NULL,
  `client_id` INT NOT NULL,
  `muntura_id` INT NOT NULL,
  `graduacio_vidre_dercho` FLOAT NULL,
  `graduacio_vidre_izqdo` FLOAT NULL,
  `muntura_color` VARCHAR(45) NOT NULL,
  `vidre_color` VARCHAR(45) NOT NULL,
  `preu` DECIMAL NOT NULL,
  PRIMARY KEY (`id_ulleres`),
  INDEX `client_id_idx` (`client_id` ASC),
  INDEX `muntura_id_idx` (`muntura_id` ASC),
  INDEX `proveidor_ulleres_id_idx` (`proveidor_ulleres_id` ASC),
  CONSTRAINT `muntura_id`
    FOREIGN KEY (`muntura_id`)
    REFERENCES `practicafinal`.`Muntura` (`id_muntura`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `client_id`
    FOREIGN KEY (`client_id`)
    REFERENCES `practicafinal`.`Clients` (`id_client`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `proveidor_ulleres_id`
    FOREIGN KEY (`proveidor_ulleres_id`)
    REFERENCES `practicafinal`.`Proveidor` (`id_proveidor`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- -----------------------------------------------------

insert into muntura (tipu) values ("flotant");
insert into muntura (tipu) values ("pasta");
insert into muntura (tipu) values ("metalica");

insert into proveidor (marca,nom,telefon,fax,nif) values ("vogue","Prove1",666123456,92345678,"12345678A");
insert into proveidor (marca,nom,telefon,fax,nif) values ("armani","Prove1",666123456,92345678,"12345678A");
insert into proveidor (marca,nom,telefon,fax,nif) values ("dolce gabbana","Prove2",620896321,98945611,"12345678B");
insert into proveidor (marca,nom,telefon,fax,nif) values ("carolina herrera","Prove3",650569874,92345644,"14234567C");
insert into proveidor (marca,nom,telefon,fax,nif) values ("etnia","Prove4",690569632,93145678,"12345678D");

insert into adreçaproveidor (proveidor_id,carrer,numero,pis,ciutat,codi_postal,pais) values ((select id_proveidor from proveidor where id_proveidor=1),"carrer1",3,2,"Barcelona",09050,"España");
insert into adreçaproveidor (proveidor_id,carrer,numero,pis,porta,ciutat,codi_postal,pais) values (2,"carrer2",10,10,"a","Madrid",09003,"España");
insert into adreçaproveidor (proveidor_id,carrer,numero,pis,porta,ciutat,codi_postal,pais) values (3,"carrer3",12,2,"2b","Barcelona",08074,"España");
insert into adreçaproveidor (proveidor_id,carrer,numero,pis,ciutat,codi_postal,pais) values (4,"carrer4",3,2,"Barcelona",09058,"España");

insert into clients (nom,adreça,telefon,email,data_registre,empleat_venta) values("clien1","Passatge Sant Joan,20",620303235,"client1@gmail.com","2020-06-20","emple1");
insert into clients (nom,adreça,telefon,email,data_registre,empleat_venta) values("clien2","Bailen,10",620382563,"client2@gmail.com","2020-06-22","emple1");
insert into clients (nom,adreça,telefon,email,data_registre,client_recomanat,empleat_venta) values("clien3","Bailen,15",650263698,"client3@gmail.com","2020-06-25","client2","emple2");

insert into ulleres (proveidor_ulleres_id,client_id,muntura_id,graduacio_vidre_dercho,graduacio_vidre_izqdo,muntura_color,vidre_color,preu) values (4,1,1,0.25,0.50,"azul","negro",350);
insert into ulleres (proveidor_ulleres_id,client_id,muntura_id,graduacio_vidre_dercho,graduacio_vidre_izqdo,muntura_color,vidre_color,preu) values (2,1,3,0.25,0.50,"negro","cristal",300);
insert into ulleres (proveidor_ulleres_id,client_id,muntura_id,graduacio_vidre_dercho,graduacio_vidre_izqdo,muntura_color,vidre_color,preu) values (3,2,2,1.50,0.50,"marron","negro",450);
insert into ulleres (proveidor_ulleres_id,client_id,muntura_id,graduacio_vidre_dercho,graduacio_vidre_izqdo,muntura_color,vidre_color,preu) values (3,3,2,0.50,1.25,"rojo","cristal",400);

-- -----------------------------------------------------
-- -----------------------------------------------------

select * from muntura;

select * from proveidor;

select * from adreçaproveidor;

select * 
from adreçaproveidor ap inner join proveidor p
on ap.proveidor_id=p.id_proveidor
where ap.ciutat="Barcelona";

select ap.ciutat
from adreçaproveidor ap inner join proveidor p
on ap.proveidor_id=p.id_proveidor
group by (ap.ciutat);

select * from clients;

select * from ulleres;

select p.marca,p.nom, u.*,c.*
from ulleres u inner join  clients c on c.id_client=u.client_id
right join proveidor p on p.id_proveidor = u.proveidor_ulleres_id;


select p.id_proveidor,p.nom, ap.ciutat, p.marca,u.*
from ulleres u inner join proveidor p on p.id_proveidor = u.proveidor_ulleres_id
inner join adreçaproveidor ap on ap.proveidor_id=p.id_proveidor;

select p.nom, ap.ciutat, p.marca, c.nom, u.*
from ulleres u inner join clients c on u.client_id= c.id_client
inner join proveidor p on p.id_proveidor = u.proveidor_ulleres_id
inner join adreçaproveidor ap on ap.proveidor_id=p.id_proveidor;



