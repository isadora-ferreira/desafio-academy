with
    fonte_pessoas as (
        select 
            cast(BUSINESSENTITYID as int) as pk_pessoa
            , cast(FIRSTNAME as string) || ' ' || cast(MIDDLENAME as string) || ' ' || cast(LASTNAME as string) as nm_cliente
        from {{ source('erp', 'PERSON') }}
    )

select *
from fonte_pessoas
where NM_CLIENTE is not null