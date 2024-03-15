SELECT
    c.first_name,
    c.last_name,
    client_bill('Silvio Blyth') AS bill
FROM
    clients c
WHERE
    c.first_name = 'Silvio' AND c.last_name = 'Blyth';product