with
    fonte_pedidos as (
        select 
            cast(SALESORDERID as int) as pk_pedido
            , cast(CREDITCARDID as int) as fk_cartao
            , cast(CUSTOMERID as int) as fk_cliente
            , cast(BILLTOADDRESSID as int) as fk_local
            , cast(ACCOUNTNUMBER as varchar) as nm_conta
            , cast(ORDERDATE as date) as data_do_pedido
            , cast(STATUS as int) as status_do_pedido 
        from {{ source('erp', 'SALESORDERHEADER') }}
    )

select *
from fonte_pedidos