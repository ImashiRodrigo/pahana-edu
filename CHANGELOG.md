# 📜 Changelog

## [1.1.0] - 2025-08-10

### Added
- Added Account Details section for improved customer information management.
- Completed Bill Print functionality enabling users to print detailed invoices.

### Fixed
- Fixed navigation issues to improve user experience and flow.
- Resolved bugs in the Billing module for accurate billing operations.
- Fixed multiple bugs in the Edit Customer and Edit Item pages to enhance stability.

### Changed
- Removed Customer ID field from `edit_customer.jsp` for cleaner UI and better data handling.
- Removed Item ID field from `edit_item.jsp` to streamline item editing process.
- Cleaned up code by removing unnecessary `System.out.println` debug statements.

---

*This release introduces new features and important bug fixes, enhancing the overall reliability and usability of the system.*
## [1.0.0] - Initial Release - Pending

### 🚀 New Features
- **User Authentication & Session Management**
    - Added login/logout functionality with secure session handling
    - Redirects unauthorized users to the login page
    - JUnit tests for login service and DAO

- **Customer Management (CRUD)**
    - Add, view, update, and delete customer records
    - Integrated with MySQL database via DAO layer
    - JUnit test coverage for DAO and service methods

- **Item Management (CRUD)**
    - Add, view, update, and delete item records
    - Includes fields for name, description, price, and stock quantity
    - JUnit tests for service and DAO layers

- **Billing Management (CRUD)**
    - Create, view, update, and delete bills
    - Manage bill items and calculate totals automatically
    - JUnit tests for billing calculations and database operations

- **Help Section Page**
    - Added `help.jsp` with user guidance and FAQs
    - Linked from navigation for quick access
    - Responsive design for better usability

### 🛠 Improvements
- Enhanced UI with responsive CSS styling
- Improved error handling and validation across forms
- Modularized code for maintainability (DAO, Service, Controller layers)

### 🧪 Testing
- JUnit tests for:
    - Login functionality
    - Customer CRUD logic
    - Item CRUD logic
    - Billing CRUD logic and calculations
- Manual browser testing of all modules

---

**Release Date:** 2025-07-31  
**Tag:** `v1.0.0`
