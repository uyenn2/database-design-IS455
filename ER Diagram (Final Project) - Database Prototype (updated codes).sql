CREATE TABLE `books` (
  `BookID` INT PRIMARY KEY,
  `Title` VARCHAR,
  `Author` VARCHAR,
  `BookSubject` VARCHAR,
  `ISBN` VARCHAR,
  `Available` BOOLEAN,
  `VendorID` INT
);

CREATE TABLE `users` (
  `UserID` integer PRIMARY KEY,
  `Username` VARCHAR,
  `Role` VARCHAR,
  `Address` VARCHAR,
  `Created_at` timestamp
);

CREATE TABLE `vendors` (
  `VendorID` INT PRIMARY KEY,
  `VendorName` VARCHAR,
  `ContactEmail` VARCHAR,
  `Status` BOOLEAN,
  `Currency` VARCHAR,
  `Address` VARCHAR,
  `Type` VARCHAR,
  `BookID` INT
);

CREATE TABLE `borrowings` (
  `UserID` INT,
  `BookID` INT,
  `BorrowedDate` DATE,
  `DueDate` DATE,
  `ReturnedDate` DATE,
  PRIMARY KEY (`UserID`, `BookID`)
);

CREATE TABLE `acquiring` (
  `VendorID` INT,
  `BookID` INT,
  `AcquisitionDate` DATE,
  `OrderStatus` BOOLEAN,
  `Price` DECIMAL,
  `Quantity` INT,
  PRIMARY KEY (`VendorID`, `BookID`)
);

ALTER TABLE `books` ADD FOREIGN KEY (`BookID`) REFERENCES `borrowings` (`BookID`);

ALTER TABLE `users` ADD FOREIGN KEY (`UserID`) REFERENCES `borrowings` (`UserID`);

ALTER TABLE `vendors` ADD FOREIGN KEY (`VendorID`) REFERENCES `books` (`BookID`);

ALTER TABLE `acquiring` ADD FOREIGN KEY (`VendorID`) REFERENCES `vendors` (`VendorID`);

ALTER TABLE `acquiring` ADD FOREIGN KEY (`BookID`) REFERENCES `books` (`BookID`);
