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

    , dim_motivos as (
        select *
        from {{ ref('dim_motivos') }}
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
            , fatos.FK_MOTIVO_DE_VENDA_RF as ID_MOTIVO_DE_VENDA
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
            , dim_motivos.NM_MOTIVO_DE_VENDA
            , dim_motivos.NM_TIPO_DE_VENDA
        from pedido_por_itens as fatos
        left join dim_produtos on fatos.fk_produto = dim_produtos.pk_produto
        left join dim_cartoes on fatos.fk_cartao = dim_cartoes.pk_cartao
        left join dim_clientes on fatos.fk_cliente = dim_clientes.pk_cliente
        left join dim_locais on fatos.fk_local = dim_locais.pk_local
        left join dim_motivos on fatos.fk_motivo_de_venda_rf = dim_motivos.pk_motivo_de_venda
    )

select 
    distinct*
from joined
order by ID_PEDIDO