1.Select *,
		Row_Number() over (order by SaleDate) as Rwn
from ProductSales.
2. Select ProductName,
		Sum(Quantity) as TotalQuantitySold,
		Dense_rank() over (order by Sum(Quantity)desc) as Rnk
from ProductSales
group by ProductName
order by Rnk
