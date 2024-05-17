with
    fonte_cidades as (
        select 
            cast (STATEPROVINCEID as int) as pk_estado
            , cast(CITY as string) as nm_cidade
        from {{ source('erp', 'ADDRESS') }}
    )

select *
from fonte_cidades