{% macro variables() %}
    {% set my_name_jinja = "Shiva" %}
    {{ log("This is "~my_name_jinja, info=True) }}

    {{ log("hello dbt user "~ var("user_name","NO USER NAME IS SET!!") ~ "!", info=True) }}

{% endmacro %}

