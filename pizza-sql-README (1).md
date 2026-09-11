# 🍕 Pizza Sales SQL Analysis

An SQL-based analysis of pizza sales data, exploring order patterns, revenue, and customer behavior using MySQL. The project is structured into three levels — **Basic**, **Intermediate**, and **Advanced** — progressing from simple aggregations to window functions and ranked analytics.

## 🗂️ Database Structure

The analysis uses four related tables:

| Table | Key Column |
|---|---|
| `orders` | `order_id` |
| `order_details` | `order_id`, `pizza_id` |
| `pizzas` | `pizza_id`, `pizza_type_id` |
| `pizza_types` | `pizza_type_id` |

**Relationships:**
- `pizza_id` links `pizzas` ↔ `order_details`
- `pizza_type_id` links `pizzas` ↔ `pizza_types`
- `order_id` links `order_details` ↔ `orders`

## 📁 Project Structure

```
├── Basic_Project.sql
├── Intermediate.sql
├── ADVANCE.sql
└── README.md
```

## 🟢 Basic Queries (`Basic_Project.sql`)

1. Total number of orders placed
2. Total revenue generated from pizza sales
3. Highest-priced pizza
4. Most commonly ordered pizza size
5. Top 5 most ordered pizza types by quantity

## 🟡 Intermediate Queries (`Intermediate.sql`)

1. Total quantity ordered per pizza category (using JOINs)
2. Distribution of orders by hour of the day
3. Category-wise distribution of pizza types
4. Average quantity of pizzas ordered per day
5. Top 3 most ordered pizza types based on revenue

## 🔴 Advanced Queries (`ADVANCE.sql`)

1. Percentage contribution of each pizza type to total revenue
2. Cumulative revenue over time using window functions (`SUM() OVER`)
3. Top 3 pizza types by revenue **within each category**, using `DENSE_RANK()`

## 🛠️ Tools & Concepts Used

- **MySQL**
- JOINs (INNER JOIN across 4 tables)
- Aggregate functions (`SUM`, `COUNT`, `AVG`, `MAX`)
- `GROUP BY`, `ORDER BY`, `LIMIT`
- Common Table Expressions (CTEs) with `WITH`
- Window functions: `SUM() OVER()`, `DENSE_RANK() OVER(PARTITION BY ...)`
- Subqueries

## 📌 How to Use

1. Set up the `pizzas`, `pizza_types`, `orders`, and `order_details` tables in MySQL
2. Run `Basic_Project.sql` → `Intermediate.sql` → `ADVANCE.sql` in order
3. Each query is commented with the business question it answers

## 📈 Key Business Questions Answered

- Which pizza types and categories drive the most revenue?
- What are peak ordering hours during the day?
- How does revenue accumulate over time?
- Which pizzas lead in each category, not just overall?
