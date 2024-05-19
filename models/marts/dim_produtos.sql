with
   produtos as (
        select *
        from {{ ref('stg_erp__produtos') }}
    )

    , pedidos_detalhes as (
        select *
        from {{ ref('stg_erp__pedidos_detalhes') }}
    )

    , joined as (
        select 
            produtos.PK_PRODUTO
            , pedidos_detalhes.FK_PEDIDO
            , produtos.NM_PRODUTO
            , produtos.NUMERO_PRODUTO
            , pedidos_detalhes.QUANTIDADE
            , pedidos_detalhes.PRECO_UNIDADE
            , pedidos_detalhes.DESCONTO_UNIDADE
        from produtos
        left join pedidos_detalhes on produtos.pk_produto = pedidos_detalhes.fk_produto
        where FK_PEDIDO is not null
    )

    , criada_chave_primaria as (
        select
            cast(FK_PEDIDO as varchar) || '/' || cast(PK_PRODUTO as varchar) as SK_PRODUTO
            , *
        from joined
    )

select *
from criada_chave_primaria
