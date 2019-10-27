CREATE database IF NOT EXISTS `Book_db_schema`
USE 'Bookstore';
CREATE TABLE IF NOT EXISTS `Book_db_schema`.`Authorship` (
  `AuthorID` VARCHAR(10) NOT NULL,
  `AuthorName` VARCHAR(45) NULL,
  `AuthorAddress` MEDIUMTEXT NULL,
  PRIMARY KEY (`AuthorID`),
  UNIQUE INDEX `idAuthorship_UNIQUE` (`AuthorID` ASC) VISIBLE)
ENGINE = InnoDB 
CREATE TABLE IF NOT EXISTS `Book_db_schema`.`Book` (
  `ISBN` INT NOT NULL,
  `Year` INT NULL,
  `Title` VARCHAR(150) NULL,
  `Price` DECIMAL NULL)
ENGINE = InnoDB
CREATE TABLE IF NOT EXISTS `Book_db_schema`.`Customer` (
  `CustomerEmail` VARCHAR(50) NOT NULL,
  `CustomerName` VARCHAR(45) NULL,
  `CustomerPhone` VARCHAR(15) NULL,
  `CustomerAddress` MEDIUMTEXT NULL,
  PRIMARY KEY (`CustomerEmail`),
  UNIQUE INDEX `idCustomer_UNIQUE` (`CustomerEmail` ASC) VISIBLE,
  UNIQUE INDEX `CustomerPhone_UNIQUE` (`CustomerPhone` ASC) VISIBLE)
ENGINE = InnoDB
CREATE TABLE IF NOT EXISTS `Book_db_schema`.`Publisher` (
  `Publisherid` VARCHAR(10) NOT NULL DEFAULT 0,
  `PublisherName` VARCHAR(45) NULL,
  `PublisherPhone` VARCHAR(15) NULL,
  `URL` VARCHAR(200) NULL,
  `PublisherAddress` MEDIUMTEXT NULL,
  PRIMARY KEY (`Publisherid`),
  UNIQUE INDEX `Publisherid_UNIQUE` (`Publisherid` ASC) VISIBLE,
  UNIQUE INDEX `PublisherAddress_UNIQUE` (`PublisherAddress` ASC) VISIBLE,
  UNIQUE INDEX `PublisherPhone_UNIQUE` (`PublisherPhone` ASC) VISIBLE)
ENGINE = InnoDB
CREATE TABLE IF NOT EXISTS `Book_db_schema`.`ShoppingBasket` (
  `ShoppingBasketid` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`ShoppingBasketid`))
ENGINE = InnoDB
CREATE TABLE IF NOT EXISTS `Book_db_schema`.`ShoppingBasketContents` (
  `Count` INT NOT NULL,
  PRIMARY KEY (`Count`),
  CONSTRAINT `ShoppingBasketid`
    FOREIGN KEY ()
    REFERENCES `Book_db_schema`.`ShoppingBasket` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ISBN`
    FOREIGN KEY ()
    REFERENCES `Book_db_schema`.`Book` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
CREATE TABLE IF NOT EXISTS `Book_db_schema`.`WarehouseContents` (
  `Count` INT NOT NULL,
  PRIMARY KEY (`Count`),
  CONSTRAINT `Warehouseid`
    FOREIGN KEY ()
    REFERENCES `Book_db_schema`.`Warehouse` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ISBN`
    FOREIGN KEY ()
    REFERENCES `Book_db_schema`.`Book` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
CREATE TABLE IF NOT EXISTS `Book_db_schema`.`Warehouse` (
  `Code` VARCHAR(10) NOT NULL,
  `WarehousPhone` VARCHAR(15) NULL,
  `WarehouseAddress` VARCHAR(200) NULL,
  PRIMARY KEY (`Code`),
  UNIQUE INDEX `Code_UNIQUE` (`Code` ASC) VISIBLE)
ENGINE = InnoDB