DROP TABLE RESERVES;
DROP TABLE BOATS;
DROP TABLE SAILORS;

CREATE TABLE SAILORS 
(
SID NUMBER (10), 
SNAME VARCHAR2 (20), 
RATING NUMBER (5),
AGE NUMBER,
CONSTRAINT SAILORS_PK PRIMARY KEY (SID)
);

CREATE TABLE BOATS
(
BID NUMBER (5),
BNAME VARCHAR2 (20),
COLOR VARCHAR2 (10),
CONSTRAINT BOATS_PK PRIMARY KEY (BID)
);

CREATE TABLE RESERVES
(
SID NUMBER (10),
BID NUMBER (5),
DAY DATE,
CONSTRAINT RESERVES_PK PRIMARY KEY (SID, BID, DAY),
CONSTRAINT RESERVES_SID_FK FOREIGN KEY (SID)
REFERENCES SAILORS (SID),
CONSTRAINT RESERVES_BID_FK FOREIGN KEY (BID)
REFERENCES BOATS (BID)
);

insert into SAILORS values (22, 'Dustin', 7, 45.0);
insert into SAILORS values (29, 'Brutus', 1, 33.0);
insert into SAILORS values (31, 'Lubber', 8, 55.5);
insert into SAILORS values (32, 'Andy', 8, 25.5);
insert into SAILORS values (58, 'Rusty', 10, 35.0);
insert into SAILORS values (64, 'Horatio', 7, 35.0);
insert into SAILORS values (71, 'Zorba', 10, 16.0);
insert into SAILORS values (74, 'Horatio', 9, 35.0);
insert into SAILORS values (85, 'Art', 3, 25.5);
insert into SAILORS values (95, 'Bob', 3, 63.5);

insert into BOATS values (101, 'Interlake', 'blue');
insert into BOATS values (102, 'Interlake', 'red');
insert into BOATS values (103, 'Clipper', 'green');
insert into BOATS values (104, 'Marine', 'red');

insert into RESERVES values (22, 101, '10-Oct-98');
insert into RESERVES values (22, 102, '10-Oct-98');
insert into RESERVES values (22, 103, '10-Aug-98');
insert into RESERVES values (22, 104, '10-Jul-98');
insert into RESERVES values (31, 102, '11-Oct-98');
insert into RESERVES values (31, 103, '11-Jun-98');
insert into RESERVES values (31, 104, '11-Dec-98');
insert into RESERVES values (64, 101, '9-May-98');
insert into RESERVES values (64, 102, '9-Aug-98');
insert into RESERVES values (74, 103, '9-Aug-98');
