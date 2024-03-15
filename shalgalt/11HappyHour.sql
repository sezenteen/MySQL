DELIMITER //

CREATE PROCEDURE happy_hour(IN product_type VARCHAR(50))
BEGIN
    UPDATE products
    SET price = ROUND(price * 0.8, 2)
    WHERE type = product_type
        AND price >= 10.00;

    SELECT CONCAT(name, '|', FORMAT(price, 2)) AS result
    FROM products
    WHERE type = product_type
        AND price < 10.00;

END //

DELIMITER ;
