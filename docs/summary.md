 
| 📁 **Dataset** | 🔑 **Primary Key** | 🔗 **Foreign Key** |
|---|---|---|
| `customers` | `customer_id` | — |
| `order_items` | `order_item_id` | `product_id`, `order_id` |
| `orders` | `order_id` | `customer_id` |
| `payments` | `payment_id` | `order_id` |
| `products` | `product_id` | — |


 
| 📁 **Dataset** | 🔗 **Role** |
|---|---|
| `customers` | `Parent` |
| `products` | `Product` |
| `orders` | `Parent + Child` |
| `order_items` | `Child` |
| `payments` | `Child` |

| 📁 **Date Columns** | 🔗 **Numeric Columns** |
|---|---|
| `signup_date` | `quantity` |
| `order_date` | `unit_price` |
| `payment_date` | `discount` |
| - | `payment_amount` |
| - | `price` |
| - | `cost` |
| - | `stock_quantity` |
