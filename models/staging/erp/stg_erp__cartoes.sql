with
    fonte_cartoes as (
        select 
            cast(CREDITCARDID as int) as pk_cartao 
            , cast(CARDTYPE as string) as tipo_cartao 
        from {{ source('erp', 'CREDITCARD') }}
    )

select *
from fonte_cartoes