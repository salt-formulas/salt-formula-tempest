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
  - name: /etc/tempest.conf
  - source: salt://tempest/files/tempest.conf
  - template: jinja
  - mode: 644

{%- endif %}