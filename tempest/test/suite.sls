{%- from "tempest/map.jinja" import test with context %}
{%- if test.enabled %}

tempest_packages:
  pkg.installed:
  - names: {{ test.pkgs }}

tempest_tox:
  pip.installed:
  - name: tox
  - require:
    - pkg: tempest_packages

{%- endif %}