SELECT
    ANO,
    MES,
    ID_LINHA_PRODUTO,
    ID_PONTO_VENDA,
    SUM(VALOR) AS SOMA_PONTO_EXTRA
FROM {{ source('input', 'source') }} as s
INNER JOIN dataset_teste.dim_calendario as c
    ON PARSE_DATE('%d/%m/%Y',s.DATA) = c.DATA
WHERE TIPO_COLETA LIKE 'PONTO EXTRA'
AND ANO = 2020
AND MES = 9
GROUP BY 
    ANO,
    MES,
    ID_LINHA_PRODUTO,
    ID_PONTO_VENDA