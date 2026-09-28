
| **Dataset** | **Primary Key** | **Foreign Key** |
|---| ---| ---|
| customers | customer_id | |
| order_items | order_item_id | product_id, order_id |
| orders | order_id | customer_id |
| payments | payment_id | order_id |
| products | product_id | |
 
| 📁 **Dataset** | 🔑 **Primary Key** | 🔗 **Foreign Key** |
|---|---|---|
| `customers` | `customer_id` | — |
| `order_items` | `order_item_id` | `product_id`, `order_id` |
| `orders` | `order_id` | `customer_id` |
| `payments` | `payment_id` | `order_id` |
| `products` | `product_id` | — |
