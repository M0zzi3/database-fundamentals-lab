-- 1.
CREATE DATABASE ProductionDB;
USE ProductionDB;
-- 2.
CREATE TABLE Product
(
    product_id  INTEGER NOT NULL PRIMARY KEY,
    name        varchar(255),
    description varchar(255),
);
CREATE TABLE Machine
(
    machine_id INTEGER NOT NULL PRIMARY KEY,
    name       varchar(255),
    location   varchar(255)
);
CREATE TABLE Operator
(
    operator_id INTEGER NOT NULL PRIMARY KEY,
    name        varchar(255),
    role        varchar(255)

);
CREATE TABLE ProductMachine
(
    product_id INTEGER NOT NULL FOREIGN KEY REFERENCES Product (product_id),
    machine_id INTEGER NOT NULL FOREIGN KEY REFERENCES Machine (machine_id),
);
CREATE TABLE MachineOperator
(
    machine_id  INTEGER NOT NULL FOREIGN KEY REFERENCES Machine (machine_id),
    operator_id INTEGER NOT NULL FOREIGN KEY REFERENCES Operator (operator_id),
);
CREATE TABLE MaintenanceRecord
(
    maintenance_id INTEGER NOT NULL PRIMARY KEY,
    date           DATE    NOT NULL,
    description    varchar(255),
    machine_id     INTEGER NOT NULL FOREIGN KEY REFERENCES Machine (machine_id),
    operator_id    INTEGER NOT NULL FOREIGN KEY REFERENCES Operator (operator_id),
);
-- 3.
INSERT INTO Operator (operator_id, name, role) VALUES (1, 'Adam', 'normal');
INSERT INTO Operator (operator_id, name, role) VALUES (2, 'Pawel', 'admin');

INSERT INTO Product (product_id, name, description) VALUES (1, 'car', 'red and fast');
INSERT INTO Product (product_id, name, description) VALUES (2, 'computer', 'black and powerfull');
INSERT INTO Product (product_id, name, description) VALUES (3, 'chair', 'wooden');

INSERT INTO Machine (machine_id, name, location) VALUES (1, 'THE BIG ONE', 'Block A');
INSERT INTO Machine (machine_id, name, location) VALUES (2, 'THE SMALL ONE', 'Block B');

INSERT INTO ProductMachine (product_id, machine_id) VALUES (1, 1);
INSERT INTO ProductMachine (product_id, machine_id) VALUES (2, 1);
INSERT INTO ProductMachine (product_id, machine_id) VALUES (3, 2);

INSERT INTO MachineOperator (machine_id, operator_id) VALUES (1, 2);
INSERT INTO MachineOperator (machine_id, operator_id) VALUES (1, 2);
INSERT INTO MachineOperator (machine_id, operator_id) VALUES (2, 1);

INSERT INTO MaintenanceRecord (maintenance_id, date, description, machine_id, operator_id)
    VALUES (1, '11/11/2005', '', 1, 2);