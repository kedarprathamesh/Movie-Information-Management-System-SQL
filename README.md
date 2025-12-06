# 🎬 Movie Database System (SQL)

## 📌 Project Overview
The Movie Database System is a MySQL-based relational database designed to store, manage, and retrieve information related to movies, directors, actors, genres, users, and ratings.  
It includes a fully normalized schema, advanced SQL queries, stored procedures, views, and triggers to maintain data integrity and support efficient data operations.

---

## 📁 Project Files
```

01_Database Table Schema.sql               → Contains CREATE TABLE statements & database structure
02_Sample Data Insertion.sql               → Contains all INSERT statements
03_Project_Queries.sql                     → Contains analytical and search queries
04_Stored Procedure, Views & Trigger.sql   → Contains Stored Procedures, Views, and Triggers
05 MovieDatabase SVG Doc                   → Contains ER Diagram Schema
````

---
## 📁 ER Diagram
![ER Diagram For Movie Database System](https://github.com/kedarprathamesh/Movie-Information-Management-System-SQL-/blob/main/Movie%20Database%20SVG%20DOc.svg)
---

## 🛠 Features
### ✔ Relational Database Structure  
- Movies, directors, actors, genres, users, ratings  
- Many-to-many tables (Movie_Actor, Movie_Genre)  
- Fully normalized design  

### ✔ SQL Components Included  
- **Stored Procedures**  
- **Views**  
- **Triggers**  
- **Window & aggregate functions**  
- **Advanced queries (Top 5 movies, highest rated, etc.)**

### ✔ Data Integrity  
- Foreign key constraints  
- BEFORE and AFTER triggers  
- Prevent duplicate ratings  
- Auto-update average rating

---

## 🚀 How to Run the Project

1. Install MySQL / MariaDB
2. Open MySQL Workbench or terminal
3. Run file **Database Table Schema.sql**
4. Run **Sample Data Insertion.sql**
5. Run **Stored Procedure, Views & Trigger.sql**
6. Finally, test queries using **Project_Queries.sql**

---

## 📘 Conclusion

This project demonstrates efficient relational database design, SQL programming skills, and automated data handling using procedures, views, and triggers.
It serves as a strong academic submission or portfolio project showcasing advanced SQL knowledge.

---

## 👨‍💻 Author

Movie Database System – SQL Project
Created for academic and learning purposes.
