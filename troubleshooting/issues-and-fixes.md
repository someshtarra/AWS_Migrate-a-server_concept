# 🔧 Troubleshooting Guide

## Issue 1: Agent Installation Fails
**Symptom:** Running the `aws-replication-installer-init` script fails immediately.
**Possible Causes:**
- Python is not installed. (Fix: `sudo apt install python3`)
- Incorrect AWS IAM Credentials. (Fix: Verify Access Key and Secret Key have `AWSApplicationMigrationAgentInstallationPolicy`).
- No internet access to download the agent dependencies.

## Issue 2: Replication is Stalled (Not Progressing)
**Symptom:** Initial sync is stuck at 0% or a specific percentage for hours.
**Possible Causes:**
- **Port 1500 is blocked.** Ensure the source server's outbound firewall allows TCP 1500 to the AWS Staging Subnet.
- Security Group on the Replication Server in AWS does not allow inbound TCP 1500.

## Issue 3: Test Instance Fails to Launch
**Symptom:** Clicking "Launch Test Instance" results in a Job Failure.
**Possible Causes:**
- EC2 Instance limits exceeded in the target region.
- The specified Subnet in the MGN Launch Template no longer exists or doesn't have enough available IP addresses.
- EBS volume type selected is not supported for the instance type.

## Issue 4: Application Not Working on Target Instance
**Symptom:** Instance launched successfully, but the web application is unreachable.
**Possible Causes:**
- Network interfaces changed. Sometimes applications hardcode the old IP or MAC address.
- AWS Security Groups attached to the final instance are blocking Port 80/443. (Fix: Update the EC2 Security Group).
