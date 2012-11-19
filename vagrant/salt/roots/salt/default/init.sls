include:
  - apt

default:
  pkg:
    - latest
    - names:
      - aptitude
      - build-essential
      - etckeeper
      - git-core
      - htop
      - linux-headers-virtual
      - linux-image-virtual
      - linux-virtual
      - logrotate
      - openjdk-6-jdk
      - realpath
      - sudo
      - tmux
    - require:
      - cmd: apt-upgrade

default-removed:
  pkg:
    - removed
    - names:
      - linux-headers-server
      - linux-image-server
      - linux-server
      - memtest86+
      - ubuntu-standard
    - require:
      - cmd: apt-upgrade
