SELECT
    ANO,
    MES,
    ID_PONTO_VENDA,
    SUM(CAST(VALOR AS INT)) AS SOMA_PONTO_EXTRA_AGREGADA
FROM {{ source('input', 'source') }} as s
INNER JOIN dataset_teste.dim_calendario as c
    ON PARSE_DATE('%d/%m/%Y',s.DATA) = c.DATA
WHERE TIPO_COLETA LIKE 'PONTO EXTRA'
AND ANO = 2020
AND MES = 9
GROUP BY 
    ANO,
    MES,
    ID_PONTO_VENDA