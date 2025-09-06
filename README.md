# 🛒 Flexispot - Automation Project with Robot Framework 

## 📌 Project Overview
This project demonstrates end-to-end automation testing for an **E-commerce web application** using **Robot Framework + SeleniumLibrary**. This project automates testing for the demo e-commerce website Demoblaze
**[(https://www.demoblaze.com/)]**.


The focus is on **core user flows**:
- ✅ User Login  
- ✅ Product Search & Add to Cart    
- ✅ Contact
- ✅ Place an Order / Checkout 

This project ensures that **critical shopping functionalities work seamlessly** from login to checkout.

---

## ⚙️ Tech Stack
- **Robot Framework** (keyword-driven automation)  
- **SeleniumLibrary** (browser automation)  
- **Python**  
- **Chrome + ChromeDriver**  

---

## 📂 Project Structure

```plaintext
Ecommerce_Automation/
│
├── Tests/
│   ├── user_login.robot     # Login functionality
│   ├── addtocart.robot      # Select & add product
│   ├── checkout.robot       # Place an order
│   └── contact.robot        # Send a message via Contact form
│
├── README.md  
└── Project documentation
```



## 🧪 Test Cases

### 1. Login Module

1. **Login Successful With Valid Username and Valid Password**  
   - Verify that a user can log in with valid credentials.

2. **Login Unsuccessful With Valid Username & Invalid Password**  
   - Verify that login is denied when the username is correct but the password is wrong.

3. **Login Unsuccessful With Invalid Username & Valid Password**  
   - Verify that login is denied when the username is incorrect but the password is correct.

4. **Login Unsuccessful With Invalid Username & Invalid Password**  
   - Verify that login is denied when both username and password are incorrect.

5. **Login Unsuccessful With Empty Fields**  
   - Verify that login is denied when username and/or password fields are empty.

6. **Logout Successful After Login**  
   - Verify that a logged-in user can successfully log out.

### 2. Add to Cart Module
The following test cases verify that products can be added to the cart correctly:

1. **Add Item from Phone Category To Cart**  
   - Verify that a user can add a single product from the Phone section to the shopping cart.

2. **Add Item from Laptop Category To Cart**  
   - Verify that a user can add a single product from the Laptop section to the shopping cart.

3. **Add Item from Monitor Category To Cart**  
   - Verify that a user can add a single product from the Monitor section to the shopping cart.

4. **Adding Multiple Items To Cart**  
   - Verify that a user can add multiple products from different sections to the shopping cart and that all items are correctly displayed in the cart.

### 3. Contact Form Module

1. **Send Message Via Contact Form**  
   - **Objective:** Verify that a user can successfully send a message through the Contact Form.  
   - **Steps:**  
     1. Navigate to the Contact Us page.  
     2. Fill in all required fields (Name, Email, Subject, Message).  
     3. Click the Submit/Send button.  
   - **Expected Result:**  
     - The message is successfully sent.  
     - A confirmation or success message is displayed.  

### 4. Checkout Module
The following test cases verify the checkout and order placement functionality:

1. **Chekout Fails If Necessary Details Not Entered**  
   - **Objective:** Verify that the order cannot be placed if required fields (like shipping or payment details) are empty.  
   - **Expected Result:** The system should show an error or validation message and prevent order placement.

2. **Chekout from Cart Successfully**  
   - **Objective:** Verify that a user can successfully place an order when all required details are filled correctly.  
   - **Expected Result:** Order confirmation is displayed, and the cart is cleared or updated accordingly.

3. **Checkout After Adding A Product In Cart**  
   - **Objective:** Verify that a user can add a product to the cart and then successfully place an order.  
   - **Expected Result:** The added product appears in the cart, and the order is placed successfully after checkout.


## Diagram Representation (Workflow diagram)
                        
        Start  
          ↓  
     Launch Browser  
          ↓  
     Login Module  
          ↓  
     Product Search & Selection Module  
          ↓  
     Add to Cart Module  
          ↓  
     Checkout Module  
          ↓  
        Logout  
          ↓  
     Close Browser  
          ↓  
         End  


## ⚡ Prerequisites

Before running the tests, ensure you have the following installed:

- **Python ≥ 3.8 recommended** (https://www.python.org/downloads/)  
- **pip** (comes with Python, used for installing dependencies)  
- **Google Chrome Browser**  
- **ChromeDriver** (matching your Chrome version: https://chromedriver.chromium.org/downloads)  
- Install required Python packages:  


```pip install robotframework```

```pip install robotframework-seleniumlibrary``` 

## ▶️ Running Tests

**Run all test modules**
```python -m robot -d results Tests/```

**Run a specific test file**

Example: running only the Login module

```python -m robot -d results Tests/login.robot```

**Run a specific test case from a file**

Example: running Successful Login Test only

```python -m robot -d results -t "Successful Login Test" Tests/login.robot```
