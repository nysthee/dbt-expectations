{% macro test_expect_column_stdev_to_be_between(model, column_name,
                                                    min_value,
                                                    max_value,
                                                    row_condition=None
                                                    ) -%}
    {{ adapter.dispatch('test_expect_column_stdev_to_be_between', packages = dbt_expectations._get_namespaces()) (model, column_name,
                                                    min_value,
                                                    max_value,
                                                    row_condition
                                                    ) }}
{%- endmacro %}

{% macro default__test_expect_column_stdev_to_be_between(model, column_name,
                                                    min_value,
                                                    max_value,
                                                    row_condition
                                                    ) %}

{% set expression %}
stddev({{ column_name }})
{% endset %}
{{ dbt_expectations.expression_between(model,
                                        expression=expression,
                                        min_value=min_value,
                                        max_value=max_value,
                                        row_condition=row_condition
                                        ) }}
{% endmacro %}
