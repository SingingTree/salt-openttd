{% from 'openttd/openttd.jinja' import name with context %}
{% set fetch_from_openttd_site = true %}

{% if fetch_from_openttd_site %}
openttd.install:
  file.managed:
    - name: /tmp/openttd-1.5.3-linux-debian-jessie-amd64.deb
    - source: https://binaries.openttd.org/releases/1.5.3/openttd-1.5.3-linux-debian-jessie-amd64.deb
    - source_hash: sha256=d9dbdf6f31b3e6dc0b78ac0e8b139432807b1bda5d7669f882e1e14085a7c816
{% else %}
openttd.install:
  pkg.latest:
    - name: {{ name }}
{% endif %}

tmux.install:
  pkg.installed:
    - name: tmux