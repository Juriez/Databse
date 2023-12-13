DROP TABLE borrower;
DROP TABLE depositor;
DROP TABLE loan;
DROP TABLE account;
DROP TABLE customer;
DROP TABLE branch;

CREATE TABLE branch(branch_name VARCHAR2(20),
branch_city VARCHAR2(20),
assets NUMBER,
CONSTRAINT brnc_PK PRIMARY KEY(branch_name));

CREATE TABLE customer(customer_name VARCHAR2(20),
customer_street VARCHAR2(20),
 customer_city VARCHAR2(20),
CONSTRAINT cstmr_PK PRIMARY KEY(customer_name));

CREATE TABLE account(account_number VARCHAR2(20),
branch_name VARCHAR2(20),
balance NUMBER,
CONSTRAINT acnt_PK PRIMARY KEY(account_number),
CONSTRAINT bnc_FK FOREIGN KEY(branch_name) REFERENCES branch(branch_name));

CREATE TABLE loan(loan_number VARCHAR2(20),
branch_name VARCHAR2(20),
amount NUMBER,
CONSTRAINT ln_PK PRIMARY KEY(loan_number),
CONSTRAINT bncs_FK FOREIGN KEY(branch_name) REFERENCES branch(branch_name));

CREATE TABLE depositor(customer_name VARCHAR2(20),
account_number VARCHAR2(20),
CONSTRAINT depositor_PK PRIMARY KEY(customer_name, account_number),
CONSTRAINT customer_FK FOREIGN KEY(customer_name) REFERENCES customer(customer_name),
CONSTRAINT account_FK FOREIGN KEY(account_number) REFERENCES account(account_number));

CREATE TABLE borrower(customer_name VARCHAR2(20),
loan_number VARCHAR2(20),
CONSTRAINT borrower_PK PRIMARY KEY(customer_name, loan_number),
CONSTRAINT cust_FK FOREIGN KEY(customer_name) REFERENCES customer(customer_name),
CONSTRAINT loannn_FK FOREIGN KEY(loan_number) REFERENCES loan(loan_number));


INSERT INTO BRANCH VALUES ('Brighton', 'Brooklyn', 7100000);
INSERT INTO BRANCH VALUES ('Downtown', 'Brooklyn', 9000000);
INSERT INTO BRANCH VALUES ('Mianus', 'Horseneck', 400000);
INSERT INTO BRANCH VALUES ('North Town', 'Rye', 3700000);
INSERT INTO BRANCH VALUES ('Perryridge', 'Horseneck', 1700000);
INSERT INTO BRANCH VALUES ('Pownal', 'Beinnington', 300000);
INSERT INTO BRANCH VALUES ('Redwood', 'Palo Alto', 2100000);
INSERT INTO BRANCH VALUES ('Round Hill', 'Horseneck', 8000000);

INSERT INTO CUSTOMER VALUES ('Adams', 'Spring','Pittsfield');
INSERT INTO CUSTOMER VALUES ('Brooks', 'Senator','Brooklyn');
INSERT INTO CUSTOMER VALUES ('Curry', 'North','Rye');
INSERT INTO CUSTOMER VALUES ('Glenn', 'Sand Hill','Woodside');
INSERT INTO CUSTOMER VALUES ('Green', 'Walnut','Stamford');
INSERT INTO CUSTOMER VALUES ('Hayes', 'Main','Harrison');
INSERT INTO CUSTOMER VALUES ('Johnson', 'Alma','Palo alto');
INSERT INTO CUSTOMER VALUES ('Jones', 'Main','Harrison');
INSERT INTO CUSTOMER VALUES ('Lindsay', 'Park','Pittsfield');
INSERT INTO CUSTOMER VALUES ('Smith', 'North','Rye');
INSERT INTO CUSTOMER VALUES ('Turner', 'Putnam','Stamford');
INSERT INTO CUSTOMER VALUES ('Williams', 'Nassau','Princeton');

INSERT INTO ACCOUNT VALUES ('A-101', 'Downtown',500);
INSERT INTO ACCOUNT VALUES ('A-102', 'Perryridge',400);
INSERT INTO ACCOUNT VALUES ('A-201', 'Brighton',900);
INSERT INTO ACCOUNT VALUES ('A-215', 'Mianus',700);
INSERT INTO ACCOUNT VALUES ('A-217', 'Brighton',750);
INSERT INTO ACCOUNT VALUES ('A-222', 'Redwood',700);
INSERT INTO ACCOUNT VALUES ('A-305', 'Round Hill',350);


INSERT INTO LOAN VALUES ('L-11', 'Round Hill',900);
INSERT INTO LOAN VALUES ('L-14', 'Downtown',1500);
INSERT INTO LOAN VALUES ('L-15', 'Perryridge',1500);
INSERT INTO LOAN VALUES ('L-16', 'Perryridge',1300);
INSERT INTO LOAN VALUES ('L-17', 'Downtown',1000);
INSERT INTO LOAN VALUES ('L-23', 'Redwood',2000);
INSERT INTO LOAN VALUES ('L-93', 'Mianus',500);

INSERT INTO DEPOSITOR VALUES ('Williams', 'A-102');
INSERT INTO DEPOSITOR VALUES ('Johnson', 'A-101');
INSERT INTO DEPOSITOR VALUES ('Johnson', 'A-201');
INSERT INTO DEPOSITOR VALUES ('Jones', 'A-217');
INSERT INTO DEPOSITOR VALUES ('Lindsay', 'A-222');
INSERT INTO DEPOSITOR VALUES ('Smith', 'A-215');
INSERT INTO DEPOSITOR VALUES ('Turner', 'A-305');

INSERT INTO BORROWER VALUES ('Adams', 'L-16');
INSERT INTO BORROWER VALUES ('Curry', 'L-93');
INSERT INTO BORROWER VALUES ('Hayes', 'L-15');
INSERT INTO BORROWER VALUES ('Johnson', 'L-14');
INSERT INTO BORROWER VALUES ('Jones', 'L-17');
INSERT INTO BORROWER VALUES ('Smith', 'L-11');
INSERT INTO BORROWER VALUES ('Smith', 'L-23');
INSERT INTO BORROWER VALUES ('Williams', 'L-17');