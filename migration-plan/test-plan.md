# 🧪 Test Plan (Post-Launch Validation)

This document outlines the tests to perform on the **Test Instance** before final cutover.

## 1. System Level Validation
- [ ] Verify EC2 Instance status checks are `2/2 Passed`.
- [ ] SSH into the Test Instance using the configured key pair or AWS Systems Manager (SSM).
- [ ] Verify disk volumes (e.g., `/dev/xvda`) match the source server's size and mount points.

## 2. Service Validation
- [ ] Verify web service is running (`systemctl status nginx` or `tomcat`).
- [ ] Check system logs (`/var/log/syslog` or `/var/log/messages`) for unexpected errors or boot failures.

## 3. Application Validation
- [ ] Access the application locally (`curl -I http://localhost`).
- [ ] Access the application externally via the EC2 Public IP or Load Balancer (ensure Security Groups allow Port 80/443).
- [ ] Perform a test transaction (e.g., mock transfer, login test) to ensure database connectivity works.

## 4. Performance & Security
- [ ] Confirm no significant performance degradation compared to the source server.
- [ ] Ensure Security Groups and NACLs are properly restricting access.
