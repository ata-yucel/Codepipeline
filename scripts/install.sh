
set -e

echo ">>> [CodeDeploy] Running install.sh..."

APP_DIR="/home/ec2-user/simple-node-app"
cd "$APP_DIR" || exit 1


echo ">>> Fixing directory permissions..."
sudo chown -R ec2-user:ec2-user "$APP_DIR"


if ! command -v node &> /dev/null; then
  echo "Node.js not found, installing..."
  curl -fsSL https://rpm.nodesource.com/setup_18.x | sudo -E bash -
  sudo yum install -y nodejs
fi

echo ">>> Installing npm dependencies..."
npm install --omit=dev

echo ">>> [CodeDeploy] install.sh completed successfully."