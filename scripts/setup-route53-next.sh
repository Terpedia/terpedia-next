#!/usr/bin/env bash
# Create Route 53 CNAME record: next.terpedia.com -> terpedia.github.io
# Uses Terpedia AWS account (set AWS_PROFILE=terpedia, or configure profile "terpedia").
set -e

PROFILE="${AWS_PROFILE:-terpedia}"
DOMAIN="terpedia.com"
SUBDOMAIN="next.terpedia.com"
TARGET="terpedia.github.io"

# Optional: pass hosted zone ID to skip lookup (e.g. HOSTED_ZONE_ID=Z123... ./setup-route53-next.sh)
if [ -n "$HOSTED_ZONE_ID" ]; then
  ZONE_ID="$HOSTED_ZONE_ID"
else
  echo "Listing Route 53 hosted zones (profile: $PROFILE)..."
  ZONE_ID=$(aws route53 list-hosted-zones --profile "$PROFILE" --query "HostedZones[?Name=='${DOMAIN}.'].Id" --output text)
  if [ -z "$ZONE_ID" ] || [ "$ZONE_ID" == "None" ]; then
    echo "No hosted zone found for $DOMAIN. Create one in Route 53 or set HOSTED_ZONE_ID=Z..." >&2
    exit 1
  fi
  # Id is like /hostedzone/Z123...; strip prefix
  ZONE_ID="${ZONE_ID#/hostedzone/}"
  echo "Using hosted zone ID: $ZONE_ID"
fi

echo "Creating CNAME: $SUBDOMAIN -> $TARGET (profile: $PROFILE)"
aws route53 change-resource-record-sets --profile "$PROFILE" \
  --hosted-zone-id "$ZONE_ID" \
  --change-batch '{
  "Changes": [{
    "Action": "UPSERT",
    "ResourceRecordSet": {
      "Name": "next.terpedia.com",
      "Type": "CNAME",
      "TTL": 300,
      "ResourceRecords": [{ "Value": "terpedia.github.io" }]
    }
  }]
}'

echo "Done. Set Custom domain to next.terpedia.com in GitHub repo Settings → Pages."
