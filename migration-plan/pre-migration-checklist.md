# 📋 Pre-Migration Checklist

Before installing the AWS MGN Replication Agent, ensure the source server meets all prerequisites.

## Network & Firewall Requirements
- [ ] Port **443 (TCP)** is open outbound for communication with the AWS MGN API endpoint.
- [ ] Port **1500 (TCP)** is open outbound for data replication to the AWS Staging Area subnet.
- [ ] AWS Staging Area Subnet has a Route Table with internet access (IGW or NAT Gateway).

## OS & Hardware Requirements
- [ ] Operating System is supported (e.g., Ubuntu 18.04/20.04/22.04, RHEL/CentOS 7/8/9).
- [ ] At least **300 MB** of free RAM available for the AWS Replication Agent.
- [ ] At least **2 GB** of free disk space on the root directory (`/`).
- [ ] Python 2.7 or 3.x is installed on the source server.

## Access & Permissions
- [ ] Root/Sudo access is available on the source server.
- [ ] An IAM User with `AWSApplicationMigrationAgentInstallationPolicy` is created.
- [ ] AWS Access Key ID and Secret Access Key are generated for the agent installation.

## AWS MGN Setup
- [ ] AWS MGN is initialized in the target region.
- [ ] Replication Settings template is configured (default instance type, EBS volume type, security groups).
