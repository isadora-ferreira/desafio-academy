with
   pessoas as (
        select *
        from {{ ref('stg_erp__pessoas') }}
    )

    , clientes as (
        select *
        from {{ ref('stg_erp__clientes') }}
    )

    , joined as (
        select 
            clientes.PK_CLIENTE
            , clientes.FK_PESSOA
            , pessoas.NM_CLIENTE
        from clientes
        left join pessoas on clientes.fk_pessoa = pessoas.pk_pessoa
    )

select *
from joined