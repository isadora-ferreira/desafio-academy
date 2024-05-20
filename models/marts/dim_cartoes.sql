with
   cartoes as (
        select *
        from {{ ref('stg_erp__cartoes') }}
    )

select *
from cartoes