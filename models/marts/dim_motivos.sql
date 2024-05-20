with

    motivos as (
        select *
        from {{ ref('stg_erp__motivos') }}
    )

select *
from motivos