
<!-- GitHub: Musab1khan/odoo -->
<!-- Professional README Canvas -->

<div align="center">

<!-- Repository Title & Tagline -->
#  Odoo Installation Suite

### <i>One-Click Odoo Deployment for Ubuntu Systems</i>

<!-- Badges Section -->
[![Ubuntu](https://img.shields.io/badge/Ubuntu-22.04%2B-orange?style=for-the-badge&logo=ubuntu)](https://ubuntu.com/)
[![Odoo](https://img.shields.io/badge/Odoo-17.0-blue?style=for-the-badge&logo=odoo)](https://www.odoo.com/)
[![Bash](https://img.shields.io/badge/Bash-Script-green?style=for-the-badge&logo=gnu-bash)](https://www.gnu.org/software/bash/)
[![License](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)](LICENSE)
[![Maintenance](https://img.shields.io/badge/Maintained-Yes-green.svg?style=for-the-badge)](https://github.com/Musab1khan/odoo/graphs/commit-activity)

<!-- Social Links -->
[![GitHub Stars](https://img.shields.io/github/stars/Musab1khan/odoo?style=social)](https://github.com/Musab1khan/odoo/stargazers)
[![GitHub Forks](https://img.shields.io/github/forks/Musab1khan/odoo?style=social)](https://github.com/Musab1khan/odoo/network/members)
[![GitHub Issues](https://img.shields.io/github/issues/Musab1khan/odoo?style=social)](https://github.com/Musab1khan/odoo/issues)

</div>

---

<!-- Canvas: Hero Section -->
<div align="center">

## 🎯 **What is This?**

### Transform your Ubuntu server into a powerful ERP system in **under 5 minutes**!

```bash
# One command installation
sudo bash odoo-installer.sh
```

<!-- Hero Image/Visual -->
![Odoo Installation](https://img.shields.io/badge/⚡-Automated%20Installation-00ff00?style=flat-square&logo=cachet&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/🐘-PostgreSQL%20Ready-336791?style=flat-square&logo=postgresql&logoColor=white)
![Production Ready](https://img.shields.io/badge/🏭-Production%20Ready-ff6600?style=flat-square&logo=nginx&logoColor=white)

</div>

---

<!-- Canvas: Problem & Solution -->
##  **The Problem We Solve**

| **Traditional Installation**  | **Our Solution**  |
|---|---|
| ❌ 2-3 hours manual setup | ✅ 5 minutes automated |
| ❌ Dependency hell | ✅ Single command |
| ❌ Configuration errors | ✅ Pre-configured |
| ❌ Security mistakes | ✅ Production-ready |
| ❌ No logging setup | ✅ Complete logging |

---

<!-- Canvas: Features Grid -->
##  **Key Features**

<!-- Feature Cards -->
| Feature | Description | Status |
|---------|-------------|---------|
|  **One-Click Install** | Complete automation from scratch | ✅ Active |
|  **Security First** | Production-ready security settings | ✅ Active |
|  **Latest Odoo** | Always installs newest stable version | ✅ Active |
|  **PostgreSQL** | Optimized database configuration | ✅ Active |
|  **Comprehensive Logs** | Full logging and monitoring | ✅ Active |
|  **Auto-Start** | Systemd service with auto-restart | ✅ Active |
|  **Easy Management** | Simple service commands | ✅ Active |
|  **Web Access** | Instant browser access | ✅ Active |

---

<!-- Canvas: Quick Start Section -->
##  **Quick Start Guide**

###  Prerequisites
- Ubuntu 22.04+ (20.04 also supported)
- Root/sudo access
- Internet connection
- Minimum 2GB RAM, 2 CPU cores

###  Installation Methods

#### Method 1: Direct Download (Recommended)
```bash
# Download script
curl -O https://raw.githubusercontent.com/Musab1khan/odoo/main/odoo-installer.sh

# Make executable
chmod +x odoo-installer.sh

# Run installation
sudo bash odoo-installer.sh
```

#### Method 2: Git Clone
```bash
# Clone repository
git clone https://github.com/Musab1khan/odoo.git

# Navigate to directory
cd odoo

# Run installation
sudo bash odoo-installer.sh
```

#### Method 3: One-liner (Fastest)
```bash
sudo bash <(curl -s https://raw.githubusercontent.com/Musab1khan/odoo/main/odoo-installer.sh)
```

---

<!-- Canvas: What Happens During Installation -->
##  **Installation Process**

```mermaid
graph TD
    A[Start] --> B[System Update]
    B --> C[Install Dependencies]
    C --> D[Setup PostgreSQL]
    D --> E[Create Odoo User]
    E --> F[Download Odoo Source]
    F --> G[Setup Virtual Environment]
    G --> H[Install Python Packages]
    H --> I[Configure System]
    I --> J[Create Systemd Service]
    J --> K[Start Odoo Service]
    K --> L[Complete!]
    
    style A fill:#ff6b6b
    style L fill:#51cf66
```

---

<!-- Canvas: Access Information -->
##  **Access Your Odoo**

###  Default Access Details
| **Setting** | **Value** |
|-------------|-----------|
| **URL** | `http://your-server-ip:8069` |
| **Master Password** | `admin` |
| **Database** | Create new or use existing |
| **Admin Email** | Any valid email |
| **Admin Password** | Your choice |

###  Quick Links
- **Database Manager**: `http://localhost:8069/web/database/manager`
- **Login Page**: `http://localhost:8069/web/login`
- **Apps Store**: `http://localhost:8069/web#menu_id=1&action=1`

---

<!-- Canvas: Management Commands -->
##  **Management Dashboard**

### Service Control
```bash
# Check status
sudo systemctl status odoo

# Start service
sudo systemctl start odoo

# Stop service
sudo systemctl stop odoo

# Restart service
sudo systemctl restart odoo

# View logs
sudo tail -f /var/log/odoo/odoo.log
```

### Database Management
```bash
# Access PostgreSQL
sudo -u postgres psql

# List databases
\l

# Connect to Odoo DB
\c odoo

# Check tables
\dt
```

---

<!-- Canvas: Configuration Section -->
##  **Configuration Options**

### Basic Configuration
Edit `/etc/odoo.conf`:
```ini
[options]
admin_passwd = your_secure_password
db_host = localhost
db_port = 5432
xmlrpc_port = 8069
```

### Advanced Settings
```ini
# Performance tuning
workers = 4
limit_time_cpu = 600
limit_time_real = 1200
max_cron_threads = 2

# Security
list_db = False
proxy_mode = True
```

---

<!-- Canvas: Troubleshooting -->
##  **Troubleshooting Guide**

###  Common Issues & Solutions

| **Problem** | **Solution** |
|-------------|--------------|
| **Port 8069 in use** | Change port in `/etc/odoo.conf` |
| **Database connection failed** | Check PostgreSQL status |
| **Access denied** | Reset master password |
| **Service not starting** | Check logs: `sudo journalctl -u odoo` |
| **Permission errors** | Run: `sudo chown -R odoo:odoo /opt/odoo` |

###  Debug Commands
```bash
# Check service status
sudo systemctl status odoo

# View recent logs
sudo journalctl -u odoo -f

# Test database connection
sudo -u odoo psql -h localhost -U odoo -d odoo -W

# Check port usage
sudo lsof -i :8069
```

---

<!-- Canvas: Performance & Security -->
##  **Production Deployment**

### Security Checklist
- [ ] Change default passwords
- [ ] Configure firewall
- [ ] Enable SSL/HTTPS
- [ ] Setup reverse proxy
- [ ] Regular backups
- [ ] Monitor logs

### Performance Optimization
```bash
# System limits
echo "* soft nofile 65536" >> /etc/security/limits.conf
echo "* hard nofile 65536" >> /etc/security/limits.conf

# PostgreSQL tuning
sudo nano /etc/postgresql/*/main/postgresql.conf
```

---

<!-- Canvas: Contributing -->
##  **Contributing**

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md).

###  Ways to Contribute
-  Report bugs
-  Suggest features
-  Improve documentation
-  Submit pull requests

###  Development Setup
```bash
git clone https://github.com/Musab1khan/odoo.git
cd odoo
# Make your changes
git add .
git commit -m "Your changes"
git push origin main
```

---

<!-- Canvas: Community & Support -->
##  **Community & Support**

###  Get Help
-  [Documentation](https://github.com/Musab1khan/odoo/wiki)
-  [Report Issues](https://github.com/Musab1khan/odoo/issues)
-  [Discussions](https://github.com/Musab1khan/odoo/discussions)
-  Email: umairwali6@gmail.com

###  Show Your Support
Give us a ⭐ if this project helped you!

---

<!-- Canvas: License & Footer -->
## 📄 **License**

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.



<!-- Footer -->
---
<div align="center">

**Made with ❤️ by [Musab Khan](https://github.com/Musab1khan)**

