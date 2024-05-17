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
            , pessoas.PRIMEIRO_NOME
            , pessoas.SEGUNDO_NOME
            , pessoas.ULTIMO_NOME
        from clientes
        left join pessoas on clientes.fk_pessoa = pessoas.pk_pessoa
    )

select *
from joined
where PK_CLIENTE is not null

--PK não está única
--criar coluna concatenada com nome completo