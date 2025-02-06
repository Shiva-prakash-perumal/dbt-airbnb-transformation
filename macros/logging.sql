{% macro logging() %}
   {{ log("This is a log message", info=True) }}
{% endmacro %}

{% macro disable_logging() %}
   {# log("This is a log message", info=True) #}
{% endmacro %}