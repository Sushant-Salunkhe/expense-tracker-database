# Full Stack Expense Tracker - Database Part

This repository contains only the **database schema** for the Expense Tracker project.
The design is compatible with **Oracle 11g and earlier versions**.

## Completed
- Created `users` table for authentication
- Created `expenses` table for expense management
- Added sequences and triggers for auto-increment IDs
- Default timestamps for created_at and updated_at

## Example Inserts
```sql
INSERT INTO users (username, password_hash)
VALUES ('sushant', 'hashed_password_here');

INSERT INTO expenses (user_id, category, amount, comments)
VALUES (1, 'Food', 250.50, 'Lunch at cafe');
