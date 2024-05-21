with
    pedidos as (
        select *
        from {{ ref('stg_erp__pedidos') }}
    )

    , pedidos_detalhes as (
        select *
        from {{ ref('stg_erp__pedidos_detalhes') }}
    )

    , joined as (
        select
            pedidos_detalhes.FK_PEDIDO
            , pedidos_detalhes.FK_PRODUTO
            , pedidos.FK_CARTAO
            , pedidos.FK_CLIENTE
            , pedidos.FK_LOCAL
            , pedidos.NM_CONTA
            , pedidos.DATA_DO_PEDIDO
            , pedidos.STATUS_DO_PEDIDO
            , pedidos_detalhes.QUANTIDADE
            , pedidos_detalhes.PRECO_UNIDADE
            , pedidos_detalhes.DESCONTO_UNIDADE        
        from pedidos_detalhes
        left join pedidos on pedidos_detalhes.fk_pedido = pedidos.pk_pedido
    )

    , criada_chave_primaria as (
        select
            cast(FK_PEDIDO as varchar) || '-' || cast(FK_PRODUTO as varchar) as SK_VENDAS
            , *
        from joined
    )

select *
from criada_chave_primaria
