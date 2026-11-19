
#!/bin/bash

set -euo pipefail

# ==============================
# CONFIGURATION
# ==============================

BASE_URL="https://api-bravo.biahalong.com"

USERNAME="${API_USERNAME:-xxx}"
PASSWORD="${API_PASSWORD:-xxx}"

LOGIN_URL="${BASE_URL}/login"
SYNC_URL="${BASE_URL}/dms/inventory/sync"

# ==============================
# DATE
# ==============================


TO_DATE="${SYNC_TO_DATE:-$(date +%Y-%m-%d)}"

echo "=================================="
echo "Inventory Sync"
echo "To date:   $TO_DATE"
echo "=================================="

# ==============================
# LOGIN
# ==============================

echo "[1] Logging in..."

LOGIN_RESPONSE=$(curl -sS -f -X POST "$LOGIN_URL" \
    -H "Content-Type: application/json" \
    -d "{
        \"username\": \"$USERNAME\",
        \"password\": \"$PASSWORD\"
    }")

ACCESS_TOKEN=$(echo "$LOGIN_RESPONSE" | jq -r '.access_token // empty')

if [[ -z "$ACCESS_TOKEN" ]]; then
    echo "ERROR: Cannot get access_token"
    echo "$LOGIN_RESPONSE"
    exit 1
fi

echo "Login successful!"

# ==============================
# SYNC INVENTORY
# ==============================

echo "[2] Starting inventory synchronization..."


echo "----------------------------------"
echo "Calling sync - Batch"

RESPONSE=$(curl -sS -f -X POST "$SYNC_URL" \
    -H "Authorization: Bearer $ACCESS_TOKEN" \
    -H "Content-Type: application/json" \
    -G \
    --data-urlencode "to_date=$TO_DATE")

# Display response
echo "$RESPONSE" | jq .

echo "Synchronization completed!"


echo "=================================="
echo "IVENTORY SYNC FINISHED"
echo "=================================="
