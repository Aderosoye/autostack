# AutoStack™ – Enterprise Automation Toolkit

**Author:** Ayobamidele Adeniyi Aderosoye  
**GitHub:** [Aderosoye](https://github.com/Aderosoye)  
**Website:** [dark-systems](https://aderosoye.github.io/dark-systems)  
**License:** MIT

---

## ⚙️ Overview

**AutoStack™** is a powerful, plug-and-play automation toolkit designed for system administrators, IT engineers, and cloud professionals who need fast, repeatable, and scalable infrastructure tasks done in seconds — not hours.

Built with PowerShell and optimized for Windows environments, it provides battle-tested scripts for managing users, monitoring system health, and automating Azure VM operations.

---

## 📁 Folder Structure

```
AutoStack/
├── backend/
│   └── scripts/
│       ├── auto_user_create.ps1
│       ├── monitor_event_logs.ps1
│       └── azure_vm_auto_shutdown.ps1
├── docs/
│   └── AutoStack_User_Guide.pdf
```

---

## 🔧 Scripts Included

### 1. `auto_user_create.ps1`
Create local or AD users in bulk from a CSV file.

**CSV Format:**
```csv
Username,FullName,Password
jdoe,John Doe,Secret123!
asmith,Alice Smith,SecurePass99!
```

**Usage:**
```powershell
./auto_user_create.ps1 -CsvPath "users.csv" -CreateLocalUsers
```

---

### 2. `monitor_event_logs.ps1`
Monitors critical System event logs and emails alerts to admins.

**Usage:**
```powershell
./monitor_event_logs.ps1
```

> Customize `smtp.company.com` and email addresses in script.

---

### 3. `azure_vm_auto_shutdown.ps1`
Auto-schedules shutdowns for Azure VMs to reduce costs.

**Usage:**
```powershell
./azure_vm_auto_shutdown.ps1 -ResourceGroup "rg-prod" -VMName "vm-web01" -Time "1800"
```

---

## 📘 Documentation

See `docs/AutoStack_User_Guide.pdf` for full setup instructions, customization tips, and enterprise use cases.

---

## 📦 Buy Full Product (With Support)

🔗 [Get AutoStack on Gumroad](https://gumroad.com/yourproductlink)  
Includes:
- All scripts
- PDF walkthrough
- Support access
- Updates included

---

## 🤖 Built With

- PowerShell 5+
- Windows 10/11 / Windows Server
- Azure CLI (for Azure scripts)

---

## 🧠 Author

**Ayobamidele Adeniyi Aderosoye**  
Cloud & Automation Engineer | Founder – Dark👣 Systems  
📍 Lagos, Nigeria  
📫 adroyphill@gmail.com  
📞 +234 814 182 5145

---