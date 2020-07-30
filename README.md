## Requirements

Create a web application that uses:
- Rails (version 6.0.x)
- Database: MySQL or PostgreSQL

The web application has 4 functions:
  - Authentication 
  - Management screens 
  - APIs 
  - Tests *(optional but nice to have)*

**Notes**:
- Simple UI is ok.
- You don't have to deploy the web aplication to any server.
- **Please refrain from releasing your code to public so that everyone has equal opportunities.**

## Data models

### User

- has necessary fields for login
- has accounts

### Account

- has at least the following fields:
    - `name`: name of account
    - `bank`: name of bank (3 possible values: `VCB`, `ACB`, `VIB`)
- has transactions

### Transaction

- has at least the following fields:
    - `amount`:  amount of money
    - `transaction_type`: type of transaction (2 possible values: `withdraw`, `deposit`)

## Detail of functions
### 1. Authentication

- Create screens for users to log in and sign up
- Only authenticated users can access management screens
- No need to apply authentication for APIs

**Note**:  You can use `devise` or any ways you want for authentication.

### 2. Management screens

Users can CRUD only their own accounts and transactions.

#### 2.1 Account management screens

- Create CRUD screens for account management
   
**Notes:**
  - No need to show transactions on account management screens.
  - All input fields are required.

#### 2.2 Transaction management screens

- Create CRUD screens for transaction management

**Notes:**
  - All input fields are required.
 
### 3. APIs

#### 3.1 Get transactions of a user

- URL path: `/api/users/<user_id>/transactions`
- HTTP method: `GET`
- Request:
    - Parameters:
        |Name|Required|Data type|Description|
        | --- | --- | --- | --- |
        |`user_id`|Yes|Integer|User's ID|
        |`account_id`|No|Integer|Account's ID|
    - Note: When `account_id` is not specified, return all transactions of the user.

- Response:
    - Content type: `application/json` 
    - HTTP status: `200 OK`
    - Body: Array of user's transactions, each of which has the following fields:

        |Name|Data type|Description|
        | --- | --- | --- |
        | `id` |Integer| Transaction's ID |
        | `account_id` |Integer| Account's id |
        | `amount` |Decimal| Amount of money |
        | `bank` |String| Bank's name |
        | `transaction_type` |String| Type of transaction |
        | `created_at` |String| Created date of transaction |

- Example:  GET `/api/users/1/transactions?account_id=1`
  - Response:
    ```json
    [{
      "id": 1,
      "account_id": 1,
      "amount": 100000.00,
      "bank": "VCB",
      "transaction_type": "deposit",
      "created_at": "2020-02-10 20:00:00 +0700"
    }, { ... }]
    ```

#### 3.2. Create a transaction for a user
- URL path: `/api/users/<user_id>/transactions`
- HTTP method: `POST`
- Request:
    - Parameters:

        |Name|Required|Data type|Description|
        | --- | --- | --- | --- |
        |`user_id`|Yes|Integer|User's ID|

    - Body:

        |Name|Required|Data type|Description|
        | --- | --- | --- | --- |
        |`account_id`|Yes|Integer|Account's ID|
        | `amount`|Yes|Decimal| Amount of money |
        | `transaction_type`|Yes |String| Type of transaction |

- Response:
    - Content type: `application/json` 
    - HTTP status: `201 Created`
    - Body: Details of the created transaction with the following fields:

        |Name|Data type|Description|
        | --- | --- | --- |
        | `id` |Integer| Transaction's ID |
        | `account_id` |Integer| Account's id |
        | `amount` |Decimal| Amount of transaction |
        | `bank` |String| Bank's name |
        | `transaction_type` |String| Type of transaction |
        | `created_at` |String| Created date of transaction |

- Example: POST `/api/users/1/transactions`
  - Request body:
    ```json
    {
      "account_id": 2,
      "amount": 100000.00,
      "transaction_type": "deposit"
    }
     ```  
  - Response
    ```json
    {
      "id": 10,
      "account_id": 2,
      "amount": 100000.00,
      "bank": "VCB",
      "transaction_type": "deposit",
      "created_at": "2020-02-10 20:10:00 +0700"
    }
    ```

### 4. Tests

- Write unit tests for management screens
- Write unit tests for APIs
