with
   motivos_por_pedido as (
        select *
        from {{ ref('stg_erp__motivos_por_pedido') }}
    )

    , motivos as (
        select *
        from {{ ref('stg_erp__motivos') }}
    )

    , joined as (
        select 
            motivos_por_pedido.PK_PEDIDO
            , motivos.PK_MOTIVO_DE_VENDA as ID_MOTIVO_DE_VENDA
            , motivos.NM_MOTIVO_DE_VENDA
            , motivos.NM_TIPO_DE_VENDA 
        from motivos_por_pedido
        left join motivos on motivos_por_pedido.fk_motivo_de_venda = motivos.pk_motivo_de_venda
    )

select *
from joined

--PK não está única