SELECT 
    DATA,
    EXTRACT(YEAR FROM DATA) AS ANO,
    EXTRACT(MONTH FROM DATA) AS MES
FROM (
    SELECT 
        PARSE_DATE('%d/%m/%Y', DATA) AS DATA
    FROM {{ source('input', 'source') }}
)