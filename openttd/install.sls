{% from 'openttd/openttd.jinja' import name, openttd_source_url, opengfx_source_url with context %}
{% set fetch_from_openttd_site = true %}
{% set fetch_open_gfx = true %}

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

{% if fetch_open_gfx %}
opengfx.install:
  archive.extracted:
    - name: /tmp/opengfx
    - source: {{ opengfx_source_url }}
    - source_hash: sha1=1c25d2d4d906924725146e214910f14036820eb2
    - archive_format: tar
    - tar_options: z
{% endif %}

# Tmux
{% if salt['pillar.get']('tmux:install', false) %}
tmux.install:
  pkg.installed:
    - name: tmux
{% endif %}
