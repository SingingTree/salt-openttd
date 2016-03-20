{% from 'openttd/openttd.jinja' import name with context %}
{% set fetch_from_openttd_site = true %}

{% if fetch_from_openttd_site %}
openttd.install:
  file.managed:
    - name: /tmp/openttd-1.5.3-linux-debian-jessie-amd64.deb
    - source: https://binaries.openttd.org/releases/1.5.3/openttd-1.5.3-linux-debian-jessie-amd64.deb
    - source_hash: {{ pillar['openttd']['file_hash'] }}
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