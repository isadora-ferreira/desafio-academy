with
    fonte_pedidos_detalhes as (
        select 
            cast(SALESORDERID as int) as fk_pedido 
            , cast(PRODUCTID as int) as fk_produto
            , cast(ORDERQTY as int) as quantidade
            , cast(UNITPRICE as numeric(18,2)) as preco_unidade
            , cast(UNITPRICEDISCOUNT as numeric(18,2)) as desconto_unidade
        from {{ source('erp', 'SALESORDERDETAIL') }}
    )

select *
from fonte_pedidos_detalhes