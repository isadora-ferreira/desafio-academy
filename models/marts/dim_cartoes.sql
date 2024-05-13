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
            cartoes.PK_ID_CARTAO
            , pedidos.FK_PEDIDO
            , cartoes.TIPO_CARTAO
        from pedidos
        left join cartoes on pedidos.fk_id_cartao = cartoes.pk_id_cartao
    )

select *
from joined