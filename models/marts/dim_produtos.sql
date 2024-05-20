with
   produtos as (
        select *
        from {{ ref('stg_erp__produtos') }}
    )

select *
from produtos
