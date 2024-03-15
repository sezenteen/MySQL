DELIMITER //

CREATE FUNCTION client_bill(full_name VARCHAR(50)) RETURNS DECIMAL(19,2)
READS SQL DATA
BEGIN
    DECLARE total_price DECIMAL(19,2);

    SELECT SUM(p.price) INTO total_price
    FROM clients c
    JOIN orders_clients o ON c.id = o.client_id
    JOIN orders_product op ON o.order_id = op.orders_id
    JOIN products p ON op.products_id = p.id
    WHERE CONCAT(c.first_name, ' ', c.last_name) = full_name;

    RETURN total_price;
END //

DELIMITER ;
