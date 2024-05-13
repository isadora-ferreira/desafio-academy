with
    fonte_motivos as (
        select 
            cast(SALESREASONID as int) as pk_motivo_de_venda
            , cast(NAME as string) as nm_motivo_de_venda
            , cast(REASONTYPE as string) as nm_tipo_de_venda
        from {{ source('erp', 'SALESREASON') }}
    )

select *
from fonte_motivos