# OSS Audit Python

Name: Adhil John Babu  
Registration No: 24BCE10635  
Chosen Software: Python  

## Repository Structure

- `scripts/`: Directory containing all the 5 shell scripts
  - `system_identity.sh`
  - `package_inspector.sh`
  - `disk_auditor.sh`
  - `log_analyzer.sh`
  - `manifesto_generator.sh`

## Linux Execution Instructions

To execute the scripts, follow these step-by-step instructions.

### Prerequisites
These scripts are designed for a Kali Linux operating system. You can create a virtual machine using VirtualBox to run these scripts in a virtual Kali Linux environment.

1. **Clone the repository**:
   ```bash
   cd <path/to/your/directory>
   git clone https://github.com/adhil24bce10635/oss-audit-24BCE10635
   ```

2. **Navigate to the scripts directory**:
   ```bash
   cd oss-audit-24BCE10635
   cd scripts
   ```

3. **Ensure scripts are executable**:
   The scripts have execution permissions, but if they lack them, run:
   ```bash
   chmod +x *.sh
   ```

4. **Run the Audits sequentially**:
   - Script 1 — System Identity Report  
     This script is a system telemetry reporter that captures and displays the identity of your Linux environment. It uses command substitution to pull live data from the kernel and OS files, storing them in variables to generate a structured "snapshot" of your current session, including the distribution, user details, and system uptime.  
     ```bash
     ./system_identity.sh
     ```  
   - Script 2 — FOSS Package Inspector  
     This script is an automated package validator that verifies the presence of a specific open-source tool on a Debian-based system. It uses conditional logic (if-else) to check the package database and pattern matching (grep) to extract version details. Additionally, it employs a case statement to provide a philosophical description of the software, serving as a quick diagnostic tool to ensure your environment is correctly configured for development.  
     ```bash
     ./package_inspector.sh
     ```  
   - Script 3 — Disk and Permission Auditor  
     This script is a system security and storage auditor that performs a health check on critical Linux directories. It utilizes a for loop to iterate through an array of file paths, combining ls, awk, and du to extract ownership, permissions, and disk usage data. By incorporating error redirection (2>/dev/null) to silence permission warnings and conditional checks to verify directory existence, it provides a clean, structured report on the system's structural integrity and Python configuration.  
     ```bash
     ./disk_auditor.sh
     ```  
   - Script 4 — Log File Analyzer  
     This script is a case-insensitive log parser designed to search for specific keywords within system files. It uses a while-read loop to process data line-by-line, ensuring memory efficiency even with large files, and employs positional parameters with default expansion (${2:-"error"}) to handle user input. By combining file validation checks (-f and -s) with arithmetic expansion to count matches, it provides a structured diagnostic summary and displays the most recent entries using grep and tail.  
     ```bash
     ./log_analyzer.sh [logfile_path]
     ```  
   - Script 5 — The Open Source Manifesto Generator  
     This script is an interactive document generator that translates user responses into a formatted text file. It uses the read command to capture live input into variables and employs string concatenation to build a personalized "manifesto" block. By utilizing command substitution for timestamps and file redirection (>) for persistent storage, it automates the creation of a uniquely named .txt file based on the current system user.  
     ```bash
     ./manifesto_generator.sh
     ```  
     
