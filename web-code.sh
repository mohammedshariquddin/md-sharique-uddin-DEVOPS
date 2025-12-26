#!/bin/bash

# ==============================
# Website Hosting Script (Apache)
# ==============================

WEBSITE_DIR="/var/www/html"
INDEX_FILE="$WEBSITE_DIR/index.html"

echo "Updating system..."
sudo apt update -y

echo "Installing Apache..."
sudo apt install apache2 -y

echo "Starting Apache service..."
sudo systemctl start apache2
sudo systemctl enable apache2

echo "Deploying website..."
sudo rm -f $INDEX_FILE

sudo tee $INDEX_FILE > /dev/null <<EOF
<!DOCTYPE html>
<html>
<head>
    <title>My First DevOps Website</title>
</head>
<body>
    <h1>🚀 Website Hosted Successfully!</h1>
    <p>Hosted using Shell Script & Apache</p>
</body>
</html>
EOF

echo "Setting permissions..."
sudo chown -R www-data:www-data $WEBSITE_DIR
sudo chmod -R 755 $WEBSITE_DIR

echo "Apache Status:"
sudo systemctl status apache2 --no-pager

echo "================================="
echo "Website hosted successfully 🎉"
echo "Access it via: http://<server-ip>"
echo "================================="


SHARIQ
