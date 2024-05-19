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
            , case
                when TIPO_CARTAO is null then 'Sem cartao'
            end as SEM_CARTAO
        from pedidos
        left join cartoes on pedidos.fk_cartao = cartoes.pk_cartao
    )

    , criada_chave_primaria as (
        select
            case
                when TIPO_CARTAO is null then cast(FK_PEDIDO as varchar) || '/' || cast(SEM_CARTAO as varchar)
                else cast(FK_PEDIDO as varchar) || '/' || cast(PK_CARTAO as varchar)
            end as SK_CARTAO
            , *
        from joined
    )

select 
    distinct *
from criada_chave_primaria