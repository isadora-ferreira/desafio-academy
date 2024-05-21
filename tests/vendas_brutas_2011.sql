with
    vendas_brutas_2011 as (
        select sum(valor_negociado_bruto) as total_bruto
        from {{ ref('fct_vendas') }}
        where data_do_pedido between '2011-01-01' and '2011-12-31'
    )

select total_bruto
from vendas_brutas_2011 -- $12.646.112,16 esse é o valor conferido pelo Carlos
where total_bruto not between 12646100 and 12646200