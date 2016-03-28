{% from 'openttd/openttd.jinja' import name, openttd_source_url with context %}
{% set fetch_from_openttd_site = true %}

# OpenTTD
{% if fetch_from_openttd_site %}
openttd.install:
  pkg.installed:
    - sources:
      - {{ name }}: {{ openttd_source_url }}
{% else %}
openttd.install:
  pkg.latest:
    - name: {{ name }}
{% endif %}

# Tmux
{% if salt['pillar.get']('tmux:install', false) %}
tmux.install:
  pkg.installed:
    - name: tmux
{% endif %}