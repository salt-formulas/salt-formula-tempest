{%- if pillar.tempest is defined %}
include:
{%- if pillar.tempest.test is defined %}
- tempest.test
{%- endif %}
{%- endif %}