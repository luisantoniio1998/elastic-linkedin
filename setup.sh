#!/bin/bash
# Quick setup script for Elasticsearch lab on M2 Mac with Parallels

set -e

echo "==============================================="
echo "Elasticsearch Lab Setup for M2 Pro Mac"
echo "==============================================="
echo ""

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "❌ Homebrew not found. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "✅ Homebrew is installed"
fi

# Check if Vagrant is installed
if ! command -v vagrant &> /dev/null; then
    echo "❌ Vagrant not found. Installing..."
    brew install vagrant
else
    echo "✅ Vagrant is installed"
fi

# Check if Parallels provider is installed
if ! vagrant plugin list | grep -q vagrant-parallels; then
    echo "❌ Vagrant Parallels provider not found. Installing..."
    vagrant plugin install vagrant-parallels
else
    echo "✅ Vagrant Parallels provider is installed"
fi

# Check if Parallels Desktop is running
if ! pgrep -x "prl_client_app" > /dev/null; then
    echo "⚠️  Warning: Parallels Desktop doesn't appear to be running"
    echo "   Please start Parallels Desktop and try again"
    exit 1
else
    echo "✅ Parallels Desktop is running"
fi

echo ""
echo "==============================================="
echo "Setup complete! Next steps:"
echo "==============================================="
echo ""
echo "1. Create a lab directory:"
echo "   mkdir ~/elasticsearch-lab"
echo "   cd ~/elasticsearch-lab"
echo ""
echo "2. Copy files to the directory:"
echo "   - Vagrantfile.parallels (rename to Vagrantfile)"
echo "   - sandbox.zip"
echo ""
echo "3. Start the VM:"
echo "   vagrant up --provider=parallels"
echo ""
echo "4. SSH into the VM:"
echo "   vagrant ssh"
echo ""
echo "5. Install Elasticsearch inside the VM:"
echo "   bash /tmp/install_elasticsearch_arm64.sh"
echo ""
echo "See M2_SETUP_GUIDE.md for detailed instructions"
echo ""
