#!/bin/bash

# Odoo Installation Script for Ubuntu
# Run as: sudo bash odoo-installer.sh

echo "🚀 Starting Odoo Installation..."

# Update system
echo "📦 Updating system..."
sudo apt update && sudo apt upgrade -y

# Install dependencies
echo "🔧 Installing dependencies..."
sudo apt install -y curl wget git python3-pip python3-dev python3-venv \
    python3-wheel libxml2-dev libxslt1-dev zlib1g-dev libsasl2-dev \
    libldap2-dev libssl-dev libpq-dev libjpeg-dev libopenjp2-7-dev \
    libfreetype6-dev liblcms2-dev libblas-dev libatlas-base-dev \
    libxmlsec1-dev libffi-dev libjpeg-dev libpng-dev libpq-dev \
    build-essential

# Install PostgreSQL
echo "🐘 Installing PostgreSQL..."
sudo apt install -y postgresql postgresql-server-dev-all

# Start and enable PostgreSQL
sudo systemctl start postgresql
sudo systemctl enable postgresql

# Create Odoo user and database
echo "👤 Creating Odoo database user..."
sudo -u postgres psql << EOF
CREATE USER odoo WITH PASSWORD 'odoo123';
ALTER USER odoo WITH SUPERUSER;
CREATE DATABASE odoo OWNER odoo;
GRANT ALL PRIVILEGES ON DATABASE odoo TO odoo;
EOF

# Install wkhtmltopdf for reports
echo "📄 Installing wkhtmltopdf..."
cd /tmp
wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-3/wkhtmltopdf_0.12.6.1-3.jammy_amd64.deb
sudo apt install -y ./wkhtmltopdf_0.12.6.1-3.jammy_amd64.deb

# Create Odoo system user
echo "👤 Creating Odoo system user..."
sudo adduser --system --quiet --shell=/bin/bash --home=/opt/odoo --gecos 'ODOO' --group odoo

# Install Odoo
echo "📥 Installing Odoo..."
sudo git clone --depth 1 --branch 17.0 https://github.com/odoo/odoo.git /opt/odoo/odoo-server

# Set permissions
sudo chown -R odoo:odoo /opt/odoo/

# Create virtual environment
echo "🐍 Creating Python virtual environment..."
cd /opt/odoo/odoo-server
sudo python3 -m venv venv
sudo chown -R odoo:odoo venv

# Install Python dependencies
echo "📚 Installing Python dependencies..."
sudo -u odoo /opt/odoo/odoo-server/venv/bin/pip install --upgrade pip
sudo -u odoo /opt/odoo/odoo-server/venv/bin/pip install -r requirements.txt

# Create Odoo configuration
echo "⚙️ Creating Odoo configuration..."
sudo tee /etc/odoo.conf > /dev/null << EOF
[options]
admin_passwd = admin
db_host = localhost
db_port = 5432
db_user = odoo
db_password = odoo123
addons_path = /opt/odoo/odoo-server/addons
logfile = /var/log/odoo/odoo.log
xmlrpc_port = 8069
EOF

# Create log directory
sudo mkdir -p /var/log/odoo
sudo chown odoo:odoo /var/log/odoo

# Create systemd service
echo "🔧 Creating systemd service..."
sudo tee /etc/systemd/system/odoo.service > /dev/null << EOF
[Unit]
Description=Odoo
Documentation=http://www.odoo.com
After=network.target postgresql.service

[Service]
Type=simple
User=odoo
ExecStart=/opt/odoo/odoo-server/venv/bin/python /opt/odoo/odoo-server/odoo-bin -c /etc/odoo.conf
WorkingDirectory=/opt/odoo/odoo-server
StandardOutput=journal+console

[Install]
WantedBy=multi-user.target
EOF

# Set permissions
sudo chmod 644 /etc/odoo.conf
sudo chown odoo:odoo /etc/odoo.conf

# Reload systemd and start Odoo
echo "🚀 Starting Odoo service..."
sudo systemctl daemon-reload
sudo systemctl enable odoo
sudo systemctl start odoo

# Wait for service to start
sleep 10

# Check status
echo "📊 Checking Odoo status..."
sudo systemctl status odoo

echo "✅ Odoo Installation Complete!"
echo ""
echo "📋 Access Information:"
echo "🌐 URL: http://$(hostname -I | awk '{print $1}'):8069"
echo "👤 Default Login: admin"
echo "🔑 Default Password: admin"
echo ""
echo "📁 Important Paths:"
echo "   Config: /etc/odoo.conf"
echo "   Logs: /var/log/odoo/odoo.log"
echo "   Service: sudo systemctl {start|stop|restart|status} odoo"
echo ""
echo "⚠️  Note: Use 'admin' as master password when creating databases"
