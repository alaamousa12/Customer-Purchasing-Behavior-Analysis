-- Customer Segmentation & Revenue
SELECT 
    Segment,
    COUNT(DISTINCT "Customer ID") AS Total_Customers,
    SUM(Sales) AS Total_Sales,
    ROUND(SUM(Sales) / COUNT(DISTINCT "Customer ID"), 2) AS Avg_Sales_Per_Customer
FROM train
GROUP BY Segment
ORDER BY Total_Sales DESC;

-- Top 10 High-Value Customers
SELECT 
    "Customer ID",
    "Customer Name",
    Segment,
    SUM(Sales) AS Total_Spent,
    COUNT(DISTINCT "Order ID") AS Total_Orders
FROM train
GROUP BY "Customer ID", "Customer Name", Segment
ORDER BY Total_Spent DESC
LIMIT 10;