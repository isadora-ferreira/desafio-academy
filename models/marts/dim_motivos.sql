with

    motivos as (
        select *
        from {{ ref('stg_erp__motivos') }}
    )

    , motivos_por_pedido as (
        select *
        from {{ ref('stg_erp__motivos_por_pedido') }}
    )

    , joined as (
        select
            motivos_por_pedido.PK_PEDIDO
            , motivos.PK_MOTIVO_DE_VENDA as FK_MOTIVO_DE_VENDA
            , motivos.NM_MOTIVO_DE_VENDA
            , motivos.NM_TIPO_DE_VENDA
            , row_number() over (partition by PK_PEDIDO order by PK_PEDIDO) as row_num
            --, case
             --   when row_num = null THEN NM_TIPO_DE_VENDA
            --end as "MOTIVO_1"
            --, case
            --    when row_num = 1 THEN null
            --    when row_num = 2 THEN NM_TIPO_DE_VENDA
            --    when row_num = 3 THEN null
            --end as "MOTIVO_2"
            --, case
            --    when row_num = 1 THEN null
            --    when row_num = 2 THEN null
            --    when row_num = 3 THEN NM_TIPO_DE_VENDA
            --end as "MOTIVO_3"
        from motivos
        left join motivos_por_pedido on motivos.pk_motivo_de_venda = motivos_por_pedido.fk_motivo_de_venda
        where PK_PEDIDO is not null    
    )

    , criada_chave_primaria as (
        select
            cast (PK_PEDIDO as varchar) || '-' || cast(FK_MOTIVO_DE_VENDA as varchar) as SK_MOTIVO_POR_PEDIDO
        , *
        from joined
    )

select *
from criada_chave_primaria


