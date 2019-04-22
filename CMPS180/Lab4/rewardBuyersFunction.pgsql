CREATE FUNCTION rewardBuyersFunction(theSellerID integer, theCount integer)
RETURNS integer AS $$
    DECLARE 
        buyer integer;
        result integer := 0;
        temp integer;
        category CHAR(1);
        increase integer;
        c REFCURSOR;
    
    BEGIN
    
    OPEN c FOR EXECUTE
        'SELECT buyerid AS buyer, c.category as category
        FROM buyersellertotalcost, Customers c  
        WHERE sellerid = $1
        AND c.customerID = buyerID
        AND
        (   select count(*) 
            from buyersellertotalcost as b 
            where b.sellerid = buyersellertotalcost.sellerid 
            and b.totalcost >= buyersellertotalcost.totalcost
        ) <= $2
        ORDER BY sellerid DESC, totalcost DESC' 
        USING theSellerID, theCount;
        
    FETCH NEXT FROM c INTO buyer, category;
    WHILE(FOUND)
    LOOP
        IF category = 'H' THEN increase = 50;
        ELSIF category = 'M' THEN increase = 20;
        ELSIF category = 'L' THEN increase = 5;
        ELSE increase = 1;
        END IF;
        UPDATE Trades as t
            SET volume = volume + increase
            WHERE t.buyerid = buyer AND t.sellerID = theSellerID;
        get diagnostics temp = row_count;
        result = result + temp;
        FETCH NEXT FROM c INTO buyer, category;
    END LOOP;
    CLOSE c;
    return result;
    END;
$$ LANGUAGE plpgsql;
