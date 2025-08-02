# ✅ Staging Testing Checklist for v1.0.0

**Target Branch:** `staging`  
**Merge Source:** `dev`  
**Date:** 2025-08-02


---

## 🔍 General Goals

- Verify new features from `dev` branch work as expected
- Validate UI flow and interaction
- Confirm JUnit test suite runs without errors
- Review CHANGELOG and versioning

---

## 📋 Feature Testing

| Module              | Test Case Description                                 | Status          |
|---------------------|-------------------------------------------------------|-----------------|
| Authentication      | Login with valid/invalid credentials                  | ☐ Pass / ☐ Fail |
| Logout              | Logout clears session and redirects to login          | ☐ Pass / ☐ Fail |
| Dashboard           | Links to all modules are visible and functional       | ☐ Pass / ☐ Fail |
| Customer Management | Add, edit, delete, list customers                     | ☐ Pass / ☐ Fail |
| Item Management     | Add, edit, delete, list items with styled UI          | ☐ Pass / ☐ Fail |
| Billing Module      | Create bill with multiple items, quantity, total calc | ☐ Pass / ☐ Fail |
| Billing Module      | View bill details correctly                           | ☐ Pass / ☐ Fail |
| Help Page           | Opens help.jsp from dashboard and shows guide         | ☐ Pass / ☐ Fail |

---

## 🧪 JUnit Testing

| Task                                            | Status |
|-------------------------------------------------|-------|
| `mvn clean test` runs successfully              | ✅Pass |
| DAO layer tests (Customer, Item) pass           | ✅Pass |
| Service layer tests (Customer, Item, Auth) pass | ✅Pass |
| Test setup and teardown logic verified          | ✅Pass |

---

## 🛠 Technical Checks

| Task                                       | Status     |
|--------------------------------------------|------------|
| `pom.xml` version set to `1.0.0`           | ✅ Confirmed |
| `CHANGELOG.md` entry for v1.0.0 is present | ✅ Confirmed |
| App builds and runs without crash          | ✅ Confirmed |
| No debugging code or console logs remain   | ✅ Confirmed |

---

## 🗒 Notes

- _[Any issues found or additional notes]_

---

### ✅ Ready to Merge into `regression`: ✅Yes 