# salt-openttd

Simple sls for installing openttd. Can install from package management or from openttd site (with some configuration).

Place in your salt heirachy (e.g. ```/srv/salt/openttd```) and run using salt (e.g. ```salt-call --local state.sls openttd```).

Tested with salts installed via salt bootstrap, should work with various older versions, though I have had some issues despite theoretical compatibility.
