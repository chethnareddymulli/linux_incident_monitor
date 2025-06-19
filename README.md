# Linux Incident Response and Monitoring Dashboard

## Overview

This project is a **Linux Incident Response and Monitoring Dashboard** designed to help system administrators and support engineers automatically monitor, log, and report critical system incidents on Linux servers. It uses shell scripting to parse system logs for security events like failed SSH login attempts, stores incident data in a MariaDB database, and generates daily CSV reports for easy review. Automation with cron jobs ensures continuous, hands-off monitoring, making it a practical tool for Linux support roles requiring Linux and SQL skills.

---

## Features

- Detects and logs security incidents (e.g., failed SSH login attempts).
- Stores incident data in a MariaDB database.
- Generates daily incident reports in CSV format.
- Automates monitoring and reporting using cron jobs.
- Easily extensible to add new incident types.

---



## Setup Instructions

1. **Clone the repository**

```bash
git clone https://github.com/your-username/linux_incident_monitor.git
cd linux_incident_monitor


###Troubleshooting


Use sudo if permission errors occur.
Ensure MariaDB is running and credentials are correct.
Adjust log file paths if your Linux distro differs.


