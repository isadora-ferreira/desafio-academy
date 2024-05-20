with
    fonte_cidades as (
        select 
            cast (ADDRESSID as int) as pk_local
            , cast (STATEPROVINCEID as int) as fk_estado
            , cast(CITY as string) as nm_cidade
        from {{ source('erp', 'ADDRESS') }}
    )

select *
from fonte_cidades