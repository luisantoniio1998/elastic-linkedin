# Elasticsearch Lab

A small local lab to follow the LinkedIn Learning Elasticsearch course on Apple Silicon Macs.

It creates a tiny Ubuntu VM, installs Elasticsearch and Kibana, and gives you a local sandbox to run the course examples.

What you need

- macOS with Apple Silicon (M1, M2, M3)
- Parallels Desktop running
- Homebrew
- Vagrant (>= 2.2)
- Vagrant Parallels provider

Quick start

1. From this project folder, run:

```bash
bash setup.sh
```

2. Start the VM:

```bash
vagrant up --provider=parallels
```

3. SSH into the VM:

```bash
vagrant ssh
```

4. Inside the VM, install Elasticsearch:

```bash
bash /tmp/install_elasticsearch_arm64.sh
```

Local URLs

- Elasticsearch: http://localhost:9200
- Kibana:      http://localhost:5601

Common commands

```bash
vagrant up --provider=parallels   # start
vagrant ssh                       # connect
vagrant suspend                   # pause
vagrant resume                    # resume
vagrant halt                      # stop
vagrant destroy                   # remove VM (data lost)
```

Quick checks

```bash
curl http://localhost:9200
curl http://localhost:9200/_cluster/health
```

Troubleshooting

- Parallels not open: open Parallels and run setup again.
- Ports in use: change forwarded ports in the Vagrantfile.
- VM won't start: check disk space, update Parallels, try `vagrant destroy && vagrant up`.
- Elasticsearch won't start: SSH into the VM and run:

```bash
sudo systemctl status elasticsearch
sudo journalctl -u elasticsearch -n 50
```

Project files

- README.md
- setup.sh
- Vagrantfile
- install_elasticsearch_arm64.sh

Author

luisantoniio1998

Last updated: December 2025
