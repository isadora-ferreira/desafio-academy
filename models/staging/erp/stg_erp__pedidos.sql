with
    fonte_pedidos as (
        select 
            cast(SALESORDERID as int) as fk_pedido
            , cast(CREDITCARDID as int) as fk_id_cartao
            , cast(CUSTOMERID as int) as fk_id_cliente
            , cast(TERRITORYID as int) as fk_id_territorio
            , cast(ORDERDATE as date) as data_do_pedido
            , cast(STATUS as int) as status_do_pedido 
            , cast(SHIPTOADDRESSID as int) as id_local_envio
        from {{ source('erp', 'SALESORDERHEADER') }}
    )

select *
from fonte_pedidos