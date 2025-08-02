# 📚 Bookshop Billing & Management System

A Java-based **Bookshop Billing & Management System** that provides secure user authentication, customer management, item inventory management, billing functionality, and a help section for user guidance. The application is built with **Java Servlets**, **JSP**, **MySQL**, and includes **JUnit test coverage** for core functionalities.

---

## ✨ Features

### 🔑 User Authentication
- Secure login/logout functionality
- Session management with role-based access
- Redirects unauthorized users to the login page

### 👥 Customer Management (CRUD)
- Add, view, update, and delete customers
- Store customer details in MySQL database

### 📦 Item Management (CRUD)
- Manage bookshop inventory (name, description, price, stock quantity)
- Update or delete item records

### 🧾 Billing Management (CRUD)
- Create and manage customer bills
- Calculate totals and itemized breakdowns automatically
- Store billing data in `bills` and `bill_items` tables

### 📖 Help Section
- User guide with FAQs and troubleshooting
- Linked from navigation menu for quick access

### 🧪 Testing
- JUnit tests for DAO and service layers
- Covers CRUD operations, login validation, and billing calculations

---

## 📂 Project Structure

```
src/ 
├── model/ # Java model classes (Customer, Item, Bill, etc.)
├── dao/ # Data Access Object classes for DB operations
├── service/ # Business logic services
├── servlet/ # Servlets for handling requests
├── util/ # Utility classes (DB connection, helpers)
├── test/ # JUnit test cases
web/
├── jsp/ # JSP pages (login, dashboard, CRUD pages, help)
resources/
└── database.sql # MySQL database schema and sample data

```

---

## 🛠 Prerequisites

Before you begin, ensure you have the following installed:

- **Java JDK 8+**
- **Apache Tomcat 9+**
- **MySQL Server 5.7+ / 8+**
- **Maven** (for building the project)
- **Git** (for cloning the repository)
- **JUnit 4/5** (already included in Maven dependencies)

---

## 📥 Installation & Setup

Follow these steps to set up the application after cloning the repository.

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/<your-username>/<your-repo-name>.git
cd <your-repo-name>
```

2️⃣ Import Database
- Import the schema and sample data from:
```bash

resources/database.sql
```

3️⃣ Configure Database Connection
Open src/util/DBConnection.java (or your DB config file)

Update the credentials:
```java
private static final String URL = "jdbc:mysql://localhost:3306/bookshop_db";
private static final String USER = "root";
private static final String PASSWORD = "your_password";
```
4️⃣ Build the Project
If using Maven:
```bash
mvn clean install
```

5️⃣ Deploy to Tomcat
Copy the generated .war file from target/ to your Tomcat webapps/ folder

Or configure Tomcat in your IDE (Eclipse / IntelliJ IDEA) and run directly

6️⃣ Start the Application
Start Tomcat server

Open browser and go to:
```bash
http://localhost:8080/pahana-edu
```

🧪 Running Tests
To run JUnit tests:
```bash
mvn test
```
All tests should pass successfully before deployment.

📖 Usage
1. Login using your credentials.

2. Manage Customers – Add, view, edit, delete customer records

3. Manage Items – Add, view, edit, delete bookshop items

4.  Create Bills – Select customer, add items, generate bill

5. View Help Section – Get guidance on how to use the system

📌 Version
Current Release: v1.0.0
See [CHANGELOG.md](https://github.com/ImashiRodrigo/pahana-edu/blob/main/CHANGELOG.md) for details.

🤝 Contributing
Fork the repository

1. Create a new branch (feature/your-feature)

2. Commit your changes

3. Push to your branch

4. Open a Pull Request


