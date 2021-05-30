      WITH CitiesAggregatedData AS (
    SELECT Orders.City                              AS City
         , Count(DISTINCT Orders.order_id)          AS NoofOrders 
         , Count(DISTINCT Orders.user_id)           AS NoofCustomers
         , ROUND(Avg(Orders.basket),2)              AS AvgBasketValue 

      FROM `bi-2019-test.ad_hoc.orders_jan2021`     AS Orders 
     GROUP BY Orders.City
    HAVING Count(DISTINCT Orders.order_id)>=500
         )  
 SELECT Dataset.City                                    
      , Dataset.NoofOrders 
      , Dataset.NoofCustomers  
      , Dataset.AvgBasketValue   
   FROM CitiesAggregatedData                        AS Dataset
  ORDER BY Dataset.NoofOrders DESC 
  LIMIT 10  