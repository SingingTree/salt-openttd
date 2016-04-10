# salt-openttd

Simple sls for installing openttd. Can install from package management or from openttd site (for deb or ubuntu, with some configuration).

## Usage

Place in your salt heirachy (e.g. ```/srv/salt/openttd```) and run using salt (e.g. ```salt-call --local state.sls openttd```).

### Pillar

An example pillar is provided, showing the settings that can be used to retrieve openttd and opengfx from the official site. For opengfx you will need to specify the hash of the file being downloaded. These options should work with Debian and Ubuntu currently.

### Notes

Tested with salts installed via salt bootstrap, should work with various older versions, though I have had some issues despite theoretical compatibility.
