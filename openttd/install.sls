{% from 'openttd/openttd.jinja' import name, openttd_source_url,
opengfx_source_url, opengfx_temp_dir, opengfx_extracted_dir with context %}
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
    - name: {{ opengfx_temp_dir }}
    - source: {{ opengfx_source_url }}
    - source_hash: sha1=1c25d2d4d906924725146e214910f14036820eb2
    - archive_format: tar
    - tar_options: z
  file.copy:
    - name: /tmp/test1/opengfx.obg
    - source: {{ opengfx_extracted_dir }}/opengfx.obg
    - force: True
{% endif %}

# Tmux
{% if salt['pillar.get']('tmux:install', false) %}
tmux.install:
  pkg.installed:
    - name: tmux
{% endif %}
