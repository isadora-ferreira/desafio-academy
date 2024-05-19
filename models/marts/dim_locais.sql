with
   cidades as (
        select *
        from {{ ref('stg_erp__cidades') }}
    )

    , estados as (
        select *
        from {{ ref('stg_erp__estados') }}
    )

    , pais as (
        select *
        from {{ ref('stg_erp__pais') }}
    )

    , joined as (
        select
            estados.PK_TERRITORIO
            , estados.FK_ESTADO
            , estados.FK_PAIS
            , cidades.NM_CIDADE
            , estados.NM_ESTADO
            , pais.NM_PAIS
        from estados
        left join cidades on estados.fk_estado = cidades.pk_estado
        left join pais on estados.fk_pais = pais.pk_pais
        where NM_CIDADE is not null
    )

    , criada_chave_primaria as (
        select
            cast(PK_TERRITORIO as varchar) || '-' || cast(FK_ESTADO as varchar) || '-' || cast(NM_CIDADE as varchar) as SK_TERRITORIO
            , *
        from joined
    )

select 
    distinct *
from criada_chave_primaria