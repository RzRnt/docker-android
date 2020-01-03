#!/bin/bash
echo "Waiting For Device for 180s..."
timeout 180 adb wait-for-any-device
