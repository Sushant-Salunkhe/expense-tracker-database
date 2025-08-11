-- USERS table
CREATE TABLE users (
    user_id NUMBER PRIMARY KEY,
    username VARCHAR2(50) UNIQUE NOT NULL,
    password_hash VARCHAR2(255) NOT NULL,
    created_at DATE DEFAULT SYSDATE
);


-- USERS sequence
CREATE SEQUENCE users_seq
START WITH 1
INCREMENT BY 1
NOCACHE;


-- USERS trigger
CREATE OR REPLACE TRIGGER trg_users_id
BEFORE INSERT ON users
FOR EACH ROW
BEGIN
    :NEW.user_id := users_seq.NEXTVAL;
END;
/


-- EXPENSES table
CREATE TABLE expenses (
    expense_id NUMBER PRIMARY KEY,
    user_id NUMBER NOT NULL,
    category VARCHAR2(50) NOT NULL,
    amount NUMBER(10,2) NOT NULL,
    comments VARCHAR2(500),
    created_at DATE DEFAULT SYSDATE,
    updated_at DATE DEFAULT SYSDATE,
    CONSTRAINT fk_expenses_user FOREIGN KEY (user_id)
        REFERENCES users(user_id)
);


-- EXPENSES sequence
CREATE SEQUENCE expenses_seq
START WITH 1
INCREMENT BY 1
NOCACHE;


-- EXPENSES trigger
CREATE OR REPLACE TRIGGER trg_expenses_id
BEFORE INSERT ON expenses
FOR EACH ROW
BEGIN
    :NEW.expense_id := expenses_seq.NEXTVAL;
END;
/