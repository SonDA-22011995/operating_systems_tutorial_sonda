
#!/bin/bash

set -euo pipefail

# ==============================
# CONFIGURATION
# ==============================

BASE_URL="https://api-bravo.biahalong.com"

USERNAME="${API_USERNAME:-xxx}"
PASSWORD="${API_PASSWORD:-xxx}"

LOGIN_URL="${BASE_URL}/login"
SYNC_URL="${BASE_URL}/dms/sell-in/sync"

# ==============================
# DATE
# ==============================

# YESTERDAY=$(date -d "yesterday" +%Y-%m-%d)

FROM_DATE="${SYNC_FROM_DATE:-$(date +%Y-%m-01)}"
TO_DATE="${SYNC_TO_DATE:-$(date +%Y-%m-%d)}"

echo "=================================="
echo "Sell-in Sync"
echo "From date: $FROM_DATE"
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
# SYNC SELL-IN
# ==============================

echo "[2] Starting sell-in synchronization..."

PAGE=1

while true; do

    echo "----------------------------------"
    echo "Calling sync - Batch $PAGE"

    RESPONSE=$(curl -sS -f -X POST "$SYNC_URL" \
        -H "Authorization: Bearer $ACCESS_TOKEN" \
        -H "Content-Type: application/json" \
        -G \
        --data-urlencode "from_date=$FROM_DATE" \
        --data-urlencode "to_date=$TO_DATE")

    # Extract has_more
    HAS_MORE=$(echo "$RESPONSE" | jq -r '.has_more // empty')

    if [[ -z "$HAS_MORE" ]]; then
        echo "ERROR: Cannot find has_more in response"
        echo "$RESPONSE"
        exit 1
    fi

    echo "has_more: $HAS_MORE"

    # Display response
    echo "$RESPONSE" | jq .

    # Stop when has_more = false
    if [[ "$HAS_MORE" == "false" ]]; then
        echo "Synchronization completed!"
        break
    fi

    if [[ "$HAS_MORE" != "true" ]]; then
        echo "ERROR: Invalid has_more value: $HAS_MORE"
        exit 1
    fi

    PAGE=$((PAGE + 1))

done

echo "=================================="
echo "SELL-IN SYNC FINISHED"
echo "Total batches: $PAGE"
echo "=================================="
