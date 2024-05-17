with
    fonte_estados as (
        select 
            cast (TERRITORYID as int) as pk_territorio
            , cast(STATEPROVINCEID as int) as fk_estado
            , cast (COUNTRYREGIONCODE as string) as fk_pais
            , cast(NAME as string) as nm_estado
        from {{ source('erp', 'STATEPROVINCE') }}
    )

select *
from fonte_estados