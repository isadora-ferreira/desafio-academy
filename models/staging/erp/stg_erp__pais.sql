with
    fonte_pais as (
        select 
            cast (COUNTRYREGIONCODE as string) as pk_pais
            , cast(NAME as string) as nm_pais
        from {{ source('erp', 'COUNTRYREGION') }}
    )

select *
from fonte_pais