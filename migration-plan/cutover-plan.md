# ✂️ Final Cutover Plan

Follow these steps during the approved maintenance window (e.g., Sunday 2:00 AM) to complete the migration.

## Step 1: Prepare Source Server
- [ ] Notify stakeholders that the maintenance window has begun.
- [ ] **Stop application writes:** Stop the web server or application service on the old server to ensure no new data is written.
  ```bash
  sudo systemctl stop nginx
  sudo systemctl stop tomcat
  ```

## Step 2: Final Data Sync
- [ ] Open the AWS MGN Console.
- [ ] Wait for the **"Continuous Data Replication"** status to show that the final changes have been flushed. The lag should be near zero.

## Step 3: Launch Cutover Instance
- [ ] Select the source server in the MGN console.
- [ ] Click **Test and Cutover** -> **Launch Cutover Instances**.
- [ ] Monitor the Job progress until the EC2 instance is successfully launched.
- [ ] Once launched, click **Finalize Cutover**. This stops data replication and terminates the staging resources.

## Step 4: Validate Cutover Instance
- [ ] SSH into the new production EC2 instance.
- [ ] Run the `validation/validation-commands.sh` script to verify services.

## Step 5: DNS Switch & Go Live
- [ ] Update DNS records (Route 53 or external DNS) to point the application domain to the new AWS EC2 instance's IP or Load Balancer.
- [ ] Verify traffic is flowing to AWS.
- [ ] Inform stakeholders that migration is complete! 🎉
