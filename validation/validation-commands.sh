#!/bin/bash
# Script to quickly validate services on the launched AWS Test/Cutover instance

echo "--- System Status ---"
uptime

echo -e "\n--- Checking Web Service ---"
systemctl is-active --quiet nginx && echo "✅ Nginx is running." || echo "❌ Nginx is NOT running."

echo -e "\n--- Checking Local Web Response ---"
HTTP_STATUS=$(curl -o /dev/null -s -w "%{http_code}\n" http://localhost)
if [ "$HTTP_STATUS" -eq 200 ]; then
    echo "✅ Web server is responding (HTTP 200)."
else
    echo "❌ Web server failed to respond properly (HTTP $HTTP_STATUS)."
fi

echo -e "\n--- Checking Disk Space ---"
df -h | grep -E '^/dev'
