with
    fonte_clientes as (
        select 
            cast(CUSTOMERID as int) as pk_cliente
            , cast(PERSONID as int) as fk_pessoa
        from {{ source('erp', 'CUSTOMER') }}
    )

select *
from fonte_clientes
where fk_pessoa is not null