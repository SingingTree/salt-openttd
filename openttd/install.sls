{% from 'openttd/openttd.jinja' import name, file_name, source_url with context %}
{% set fetch_from_openttd_site = true %}

# OpenTTD
{% if fetch_from_openttd_site %}
openttd.install:
  pkg.installed:
    - sources:
      - {{ name }}: {{ source_url }}
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