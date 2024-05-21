with
    pedido_por_itens as (
        select *
        from {{ ref('int_pedido_por_itens') }}
    )

    , dim_produtos as (
        select *
        from {{ ref('dim_produtos') }}
    )

    , dim_cartoes as (
        select *
        from {{ ref('dim_cartoes') }}
    )

    , dim_clientes as (
        select *
        from {{ ref('dim_clientes') }}
    )

    , dim_locais as (
        select *
        from {{ ref('dim_locais') }}
    )

    , joined as (
        select
            fatos.SK_VENDAS
            , fatos.FK_PEDIDO as ID_PEDIDO
            , fatos.FK_PRODUTO as ID_PRODUTO
            , fatos.FK_CARTAO as ID_CARTAO
            , fatos.FK_CLIENTE as ID_CLIENTE
            , fatos.FK_LOCAL as ID_ENDERECO
            , fatos.DATA_DO_PEDIDO
            , fatos.STATUS_DO_PEDIDO
            , fatos.QUANTIDADE
            , fatos.PRECO_UNIDADE
            , fatos.DESCONTO_UNIDADE
            , dim_produtos.NM_PRODUTO
            , dim_cartoes.TIPO_CARTAO
            , dim_clientes.NM_CLIENTE
            , dim_locais.NM_CIDADE
            , dim_locais.NM_ESTADO
            , dim_locais.NM_PAIS
        from pedido_por_itens as fatos
        left join dim_produtos on fatos.fk_produto = dim_produtos.pk_produto
        left join dim_cartoes on fatos.fk_cartao = dim_cartoes.pk_cartao
        left join dim_clientes on fatos.fk_cliente = dim_clientes.pk_cliente
        left join dim_locais on fatos.fk_local = dim_locais.pk_local
    )

    , metricas as (
        select
            SK_VENDAS
            , ID_PEDIDO
            , ID_PRODUTO
            , ID_CARTAO
            , ID_CLIENTE
            , ID_ENDERECO
            , DATA_DO_PEDIDO
            , STATUS_DO_PEDIDO
            , NM_PRODUTO
            , QUANTIDADE
            , PRECO_UNIDADE
            , DESCONTO_UNIDADE
            , QUANTIDADE * PRECO_UNIDADE as valor_negociado_bruto
            , QUANTIDADE * (1 - DESCONTO_UNIDADE) * PRECO_UNIDADE as valor_negociado_liquido
            , TIPO_CARTAO
            , NM_CLIENTE
            , NM_CIDADE
            , NM_ESTADO
            , NM_PAIS
        from joined
    )

select *
from metricas