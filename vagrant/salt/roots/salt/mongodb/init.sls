mongodb:
    pkg:
        - name: mongodb-10gen
        - installed
    service:
        - running
        - require:
            - file: mongo-dirs
            - file: /etc/mongodb.conf
            - file: /var/log/mongodb
    user:
      - present
      - uid: 70002
      - gid: 70002
      - require:
        - group: mongodb
    group:
      - present
      - gid: 70002

mongo-dirs:
  file:
    - directory
    - user: mongodb
    - group: mongodb
    - mode: 755
    - names:
      - /var/log/mongodb
      - /usr/libexec
      - /usr/libexec/mongo
    - require:
      - user: mongodb
      - group: mongodb

/etc/mongodb.conf:
  file:
    - managed
    - user: mongodb
    - group: mongodb
    - mode: 644
    - source: salt://mongodb/files/mongodb.conf
    - template: jinja
    - context:
        replSet:
    - require:
      - pkg: mongodb
