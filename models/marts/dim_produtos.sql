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
    )

select *
from joined

--PK não está única