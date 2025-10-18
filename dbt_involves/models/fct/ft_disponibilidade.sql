SELECT
    ANO,
    MES,
    ID_LINHA_PRODUTO,
    COUNT(*) AS CONTAGEM_PRODUTO
FROM {{ source('input', 'source') }} AS s
INNER JOIN dataset_teste.dim_calendario AS c
    ON PARSE_DATE('%d/%m/%Y',s.DATA)  = c.DATA
WHERE VALOR LIKE 'SIM'
AND ANO = 2020
AND MES = 9
GROUP BY 
    ANO,
    MES,
    ID_LINHA_PRODUTO