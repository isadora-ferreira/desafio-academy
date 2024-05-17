with
    fonte_produtos as (
        select 
            cast(PRODUCTID as int) as pk_produto
            , cast(NAME as string) as nm_produto
            , cast(PRODUCTNUMBER as varchar) as numero_produto 
        from {{ source('erp', 'PRODUCT') }}
    )

select *
from fonte_produtos