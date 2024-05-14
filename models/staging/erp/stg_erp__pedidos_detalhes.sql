with
    fonte_pedidos_detalhes as (
        select 
            cast(SALESORDERID as int) as pk_pedido 
            , cast(SALESORDERDETAILID as int) as fk_detalhe_pedido
            , cast(PRODUCTID as int) as fk_id_produto
            , cast(ORDERQTY as int) as quantidade
            , cast(UNITPRICE as int) as preco_unidade
            , cast(UNITPRICEDISCOUNT as int) as desconto_unidade
        from {{ source('erp', 'SALESORDERDETAIL') }}
    )

select *
from fonte_pedidos_detalhes