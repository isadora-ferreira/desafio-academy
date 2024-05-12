with
    fonte_motivos_por_pedido as (
        select 
            cast(SALESORDERID as int) as pk_pedido
            , cast(SALESREASONID as int) as fk_motivo_de_venda
            , cast(MODIFIEDDATE as date) as data
        from {{ source('erp', 'SALESORDERHEADERSALESREASON') }}
    )

select *
from fonte_motivos_por_pedido