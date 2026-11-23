# Elasticsearch Lab

I use this lab to follow the LinkedIn Learning Elasticsearch course on an Apple Silicon Mac.

It uses Vagrant and Parallels to create an Ubuntu ARM64 VM for the course examples. The repository also includes an Elasticsearch installation script.

## Requirements

- macOS with Apple Silicon (M1, M2, M3)
- Parallels Desktop running
- Homebrew
- Vagrant (>= 2.2)
- Vagrant Parallels provider

## Run the lab

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
bash /vagrant/install_elasticsearch_arm64.sh
```

## Forwarded ports

- Elasticsearch: http://localhost:9200
- Kibana: http://localhost:5601 (once installed in the VM)

## VM commands

```bash
vagrant up --provider=parallels   # start
vagrant ssh                       # connect
vagrant suspend                   # pause
vagrant resume                    # resume
vagrant halt                      # stop
vagrant destroy                   # remove VM (data lost)
```

## Check Elasticsearch

```bash
curl http://localhost:9200
curl http://localhost:9200/_cluster/health
```

## Troubleshooting

- Parallels not open: open Parallels and run setup again.
- Ports in use: change forwarded ports in the Vagrantfile.
- VM won’t start: check disk space and the Parallels/Vagrant provider versions before rebuilding it. Destroying the VM removes its data.
- Elasticsearch won't start: SSH into the VM and run:

```bash
sudo systemctl status elasticsearch
sudo journalctl -u elasticsearch -n 50
```

## Files

- README.md
- setup.sh
- Vagrantfile
- install_elasticsearch_arm64.sh

The Vagrantfile also expects the course archive, `sandbox.zip`, in the project folder.
