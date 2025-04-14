#!/bin/bash

echo "[$(date)] Cron triggered this script!" >> ~/cron_test.log

cd /Users/shrajanya020/COMP-4882/spring2025_foodies_with_a_cause || exit

echo "🕒 Running summary email task..."
RAILS_ENV=development bin/rails messages:send_digest

# Open the latest letter opener email in default browser
open tmp/letter_opener/*/index.html


