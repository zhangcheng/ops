/etc/apt/preferences.d/99local:
  file:
    - managed
    - source: salt://apt/preferences.conf
    - user: root
    - group: root
    - mode: 644

/etc/apt/apt.conf.d/99local:
  file:
    - managed
    - source: salt://apt/apt.conf
    - user: root
    - group: root
    - mode: 644

/etc/apt/sources.list:
  file:
    - managed
    - source: salt://apt/sources.list
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - countrycode: cn

apt-update:
  cmd:
    - run
    - name: apt-get update
    - require:
      - file: /etc/apt/preferences.d/99local
      - file: /etc/apt/apt.conf.d/99local
      - file: /etc/apt/sources.list

apt-upgrade:
  cmd:
    - run
    - name: apt-get --assume-yes dist-upgrade
    - require:
      - cmd: apt-update
