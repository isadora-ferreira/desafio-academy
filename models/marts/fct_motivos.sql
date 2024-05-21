with
    fatos as (
        select *
        from {{ ref('int_pedido_por_itens') }}
    )

    , dim_motivos as (
        select *
        from {{ ref('dim_motivos') }}
    )

    , joined as (
        select
            fatos.SK_VENDAS
            , fatos.FK_PEDIDO as ID_PEDIDO
            , fatos.FK_PRODUTO as ID_PRODUTO
            , fatos.FK_CARTAO as ID_CARTAO
            , fatos.FK_CLIENTE as ID_CLIENTE
            , fatos.FK_LOCAL as ID_ENDERECO
            , coalesce(FK_MOTIVO_DE_VENDA, 0) as ID_MOTIVO_DE_VENDA
            , fatos.NM_CONTA
            , fatos.DATA_DO_PEDIDO
            , fatos.STATUS_DO_PEDIDO
            , fatos.QUANTIDADE
            , fatos.PRECO_UNIDADE
            , fatos.DESCONTO_UNIDADE
            , dim_motivos.NM_MOTIVO_DE_VENDA
            , dim_motivos.NM_TIPO_DE_VENDA
            , dim_motivos.ROW_NUM
        from fatos
        left join dim_motivos on fatos.fk_pedido = dim_motivos.pk_pedido
    )

    , criada_chave_primaria as (
        select
            cast (SK_VENDAS as varchar) || '-' || cast (ID_MOTIVO_DE_VENDA as varchar) as SK_MOTIVOS
            , *
        from joined
    )

select *
from criada_chave_primaria