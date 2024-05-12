with
    fonte_motivos as (
        select 
            cast(SALESREASONID as int) as pk__motivo_de_venda
            , cast(NAME as string) as nm__motivo_de_venda
            , cast(REASONTYPE as string) as nm__tipo_de_venda
        from {{ source('erp', 'SALESREASON') }}
    )

select *
from fonte_motivos