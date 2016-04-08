{% from 'openttd/openttd.jinja' import name, openttd_source_url,
openttd_install_dir, opengfx_source_url, opengfx_temp_dir,
opengfx_extracted_dir, opengfx_files with context %}
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

{% for file in opengfx_files %}
opengfx.copy_{{ file}}:
  file.copy:
    - name: {{ openttd_install_dir }}/baseset/{{ file }}
    - source: {{ opengfx_extracted_dir }}/{{ file }}
    - force: True
{% endfor %}
{% endif %}

# Tmux
{% if salt['pillar.get']('tmux:install', false) %}
tmux.install:
  pkg.installed:
    - name: tmux
{% endif %}
