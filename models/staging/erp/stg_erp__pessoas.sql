with
    fonte_pessoas as (
        select 
            cast(BUSINESSENTITYID as int) as pk_pessoa
            , cast(FIRSTNAME as string) as primeiro_nome
            , cast(MIDDLENAME as string) as segundo_nome
            , cast(LASTNAME as string) as ultimo_nome
        from {{ source('erp', 'PERSON') }}
    )

select *
from fonte_pessoas