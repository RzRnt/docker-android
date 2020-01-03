#!/bin/bash
echo "Waiting For Device for 60s..."
timeout 60 adb wait-for-any-device
