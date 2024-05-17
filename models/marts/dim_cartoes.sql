with
   cartoes as (
        select *
        from {{ ref('stg_erp__cartoes') }}
    )

    , pedidos as (
        select *
        from {{ ref('stg_erp__pedidos') }}
    )

    , joined as (
        select
            cartoes.PK_CARTAO
            , pedidos.PK_PEDIDO as FK_PEDIDO
            , cartoes.TIPO_CARTAO
        from pedidos
        left join cartoes on pedidos.fk_cartao = cartoes.pk_cartao
    )

select *
from joined
where PK_CARTAO is not null

--PK não está única