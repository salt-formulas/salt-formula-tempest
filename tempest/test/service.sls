{%- from "tempest/map.jinja" import test with context %}
{%- if test.enabled %}

include:
- git

tempest_packages:
  pkg.installed:
  - names: {{ test.pkgs }}

tempest_tox:
  pip.installed:
  - name: tox
  - require:
    - pkg: tempest_packages

tempest_dir:
  file.directory:
  - name: /srv/tempest
  - require:
    - pkg: tempest_packages

tempest_app:
  git.latest:
  - name: {{ test.source.address }}
  - target: /srv/tempest/suite
  - require:
    - file: tempest_dir
    - pkg: git_packages

tempest_config:
  file.managed:
  - name: /srv/tempest/suite/etc/tempest.conf
  - source: salt://tempest/files/tempest.conf
  - template: jinja
  - mode: 644

{#
tempest_config:
  ini_manage.options_present:
  - name: /srv/tempest/suite/etc/tempest.conf
  - sections:
      {%- for suite_name, suite in test.suite.iteritems() %}
      {{ suite_name }}:
        {%- for prop_name, prop_value in suite.iteritems() %}
        {{ prop_name }}: {{ prop_value}}
        {%- endfor %}
      {%- endfor %}
  - require:
    - git: tempest_app
#}

{%- endif %}


