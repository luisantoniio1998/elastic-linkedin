# Elasticsearch Lab - LinkedIn Learning

A comprehensive lab environment for learning Elasticsearch and the Elastic Stack, optimized for ARM64 architecture (M2 Mac) using Vagrant and Parallels Desktop.

## 📋 Overview

This project provides a complete sandbox environment for the LinkedIn Learning Elasticsearch course. It uses Vagrant to provision a Ubuntu-based virtual machine with Elasticsearch and related tools pre-configured and ready to use.

**Key Features:**
- ✅ ARM64 compatible (native support for M2 Mac)
- ✅ Automated setup with Vagrant
- ✅ Pre-configured Elasticsearch 8.x
- ✅ Kibana integration (port 5601)
- ✅ Parallels Desktop support
- ✅ One-command deployment

## 🛠️ Prerequisites

Before getting started, ensure you have the following installed:

- **macOS** with Apple Silicon (M1, M2, M3, etc.)
- **Parallels Desktop** (running)
- **Homebrew** (for package management)
- **Vagrant** (v2.2+)
- **Vagrant Parallels Provider**

## 🚀 Quick Start

### 1. Run the Setup Script

Execute the automated setup script to install and configure all dependencies:

```bash
bash setup.sh
```

This script will:
- Check and install Homebrew (if not present)
- Check and install Vagrant (if not present)
- Install the Vagrant Parallels provider
- Verify Parallels Desktop is running

### 2. Create a Lab Directory

```bash
mkdir ~/elasticsearch-lab
cd ~/elasticsearch-lab
```

### 3. Copy Project Files

Copy the following files to your lab directory:
- `Vagrantfile` - Virtual machine configuration
- `install_elasticsearch_arm64.sh` - Elasticsearch installation script
- Any additional sandbox files (if provided)

### 4. Start the Virtual Machine

```bash
vagrant up --provider=parallels
```

The first time you run this, it will:
- Download the Ubuntu 22.04 ARM64 image
- Create and configure the VM
- Allocate 4GB RAM and 2 CPU cores

### 5. SSH into the VM

```bash
vagrant ssh
```

### 6. Install Elasticsearch

Once inside the VM, run the Elasticsearch installation script:

```bash
bash /tmp/install_elasticsearch_arm64.sh
```

## ⚙️ Configuration

### VM Specifications

The Vagrantfile configures the VM with:
- **Box**: `bento/ubuntu-22.04-arm64` (ARM64 Ubuntu 22.04)
- **Memory**: 4GB RAM
- **CPUs**: 2 cores
- **Hostname**: `sandbox`

### Network Forwarding

The following ports are forwarded from guest to host:
- **9200** - Elasticsearch HTTP API
- **5601** - Kibana Web Interface

Access them locally:
- Elasticsearch: `http://localhost:9200`
- Kibana: `http://localhost:5601`

### Elasticsearch Configuration

After installation, you may need to configure Elasticsearch:

```bash
# Edit the configuration file
sudo nano /etc/elasticsearch/elasticsearch.yml

# Start Elasticsearch
sudo systemctl start elasticsearch

# Enable on boot
sudo systemctl enable elasticsearch

# Check status
sudo systemctl status elasticsearch

# Reset the elastic user password
sudo /usr/share/elasticsearch/bin/elasticsearch-reset-password -u elastic
```

## 📁 Project Structure

```
elastic-linkedin/
├── README.md                          # This file
├── setup.sh                           # Automated setup script for macOS
├── Vagrantfile                        # Vagrant VM configuration
└── install_elasticsearch_arm64.sh    # Elasticsearch installation script
```

## 🔧 Common Commands

### Vagrant Management

```bash
# Start the VM
vagrant up --provider=parallels

# SSH into the VM
vagrant ssh

# Suspend the VM
vagrant suspend

# Resume the VM
vagrant resume

# Halt the VM
vagrant halt

# Destroy the VM (removes data)
vagrant destroy

# Check VM status
vagrant status
```

### Elasticsearch Commands

```bash
# Check Elasticsearch status
curl http://localhost:9200

# Check cluster health
curl http://localhost:9200/_cluster/health

# List indices
curl http://localhost:9200/_cat/indices

# Create an index
curl -X PUT http://localhost:9200/my-index
```

## 📚 Course Resources

This lab environment is designed for the **LinkedIn Learning Elasticsearch course**. Make sure to follow along with the course materials while using this sandbox.

## 🐛 Troubleshooting

### Parallels Desktop Not Running

If you see a warning about Parallels Desktop not running:
1. Open Parallels Desktop
2. Run the setup script again

### Port Already in Use

If ports 5601 or 9200 are already in use:
1. Modify the Vagrantfile to use different ports
2. Update the `forwarded_port` entries

### VM Won't Start

1. Ensure you have sufficient disk space (at least 10GB)
2. Check that Parallels Desktop is up to date
3. Try destroying and recreating the VM: `vagrant destroy && vagrant up --provider=parallels`

### Elasticsearch Not Starting

1. SSH into the VM
2. Check the status: `sudo systemctl status elasticsearch`
3. View logs: `sudo journalctl -u elasticsearch -n 20`

## 💡 Tips

- Keep the VM running while working through the course
- Use `vagrant suspend` to pause the VM if not in use (faster than destroying)
- Back up any important data before running `vagrant destroy`
- For better performance, allocate more RAM in the Vagrantfile if your Mac has sufficient memory

## 📝 License

This project is provided as part of the LinkedIn Learning Elasticsearch course material.

## 👤 Author

**luisantoniio1998**

For questions or issues related to this lab environment, please refer to the course discussion forums.

---

**Last Updated**: December 2025
**Compatible with**: M1, M2, M3 and newer Apple Silicon Macs
