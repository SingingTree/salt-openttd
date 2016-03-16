{% from 'openttd/openttd.jinja' import name with context %}

openttd.install:
  pkg.latest
    - name: {{ name }}

tmux.install:
  pkg.installed:
    - name: tmux