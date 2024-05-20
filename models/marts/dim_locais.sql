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
            cidades.PK_LOCAL
            , cidades.NM_CIDADE
            , estados.NM_ESTADO
            , pais.NM_PAIS
        from estados
        left join cidades on estados.pk_estado = cidades.fk_estado
        left join pais on estados.fk_pais = pais.pk_pais
        where NM_CIDADE is not null
    )

select *
from joined