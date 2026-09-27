# SQL Journey - Day 25
## Date Functions - Problem Solving

**Date:** 27-09-2026

Today's session focuses entirely on solving problems involving SQL Date and Time functions.

Date functions have been one of my weaker areas, so today's goal is to improve practical problem-solving rather than simply memorizing syntax.

-----

# 1. Important Date Data Types

Common date-related data types:

- DATE
- DATETIME
- TIMESTAMP
- TIME

### DATE

Stores only the date.

Example:

2026-09-27

### DATETIME

Stores both date and time.

Example:

2026-09-27 14:30:00

### TIME

Stores only the time.

Example:

14:30:00

------

# 2. Current Date and Time

### CURDATE()

Returns the current date.

```sql
SELECT CURDATE();
