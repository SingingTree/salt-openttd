{% from 'openttd/openttd.jinja' import name, openttd_source_url,
openttd_install_dir, opengfx_source_url, opengfx_temp_dir,
opengfx_extracted_dir, opengfx_files with context %}

#TODO: create an openttd user

# OpenTTD
{% if salt['pillar.get']('openttd:install_from_site', false) %}
openttd.install:
  pkg.installed:
    - sources:
      - {{ name }}: {{ openttd_source_url }}
{% else %}
openttd.install:
  pkg.latest:
    - name: {{ name }}
{% endif %}
{% if salt['pillar.get']('openttd:add_user', false) %}
openttd.add_user:
  user.present:
   - name: {{ pillar['openttd']['user'] }}
   - shell: /bin/bash
  group.present:
    - name: {{ pillar['openttd']['group'] }}
    - members:
      - {{ pillar['openttd']['user'] }}
{% endif %}

# OpenGfx
{% if salt['pillar.get']('opengfx:fetch', false) %}
opengfx.install:
  archive.extracted:
    - name: {{ opengfx_temp_dir }}
    - source: {{ opengfx_source_url }}
    - source_hash: {{ pillar['opengfx']['source_hash']}}
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
