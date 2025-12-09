# Installation script for Elasticsearch 8.x on ARM64 (M2 Mac compatible)
# Adapted for ARM64 architecture

# Add Elasticsearch GPG key
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg

# Add repository with ARM64 architecture support
echo "deb [arch=arm64 signed-by=/usr/share/keyrings/elasticsearch-keyring.gpg] https://artifacts.elastic.co/packages/8.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-8.x.list

# Update and install
sudo apt-get update && sudo apt-get install -y elasticsearch

# Note: After installation, you may need to:
# 1. Configure Elasticsearch: sudo nano /etc/elasticsearch/elasticsearch.yml
# 2. Start Elasticsearch: sudo systemctl start elasticsearch
# 3. Enable on boot: sudo systemctl enable elasticsearch
# 4. Check status: sudo systemctl status elasticsearch
# 5. Get the auto-generated password: sudo /usr/share/elasticsearch/bin/elasticsearch-reset-password -u elastic
