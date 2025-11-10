
set -e

echo ">>> [CodeDeploy] Running install.sh..."


cd /home/ec2-user/simple-node-app || exit 1


if ! command -v node &> /dev/null; then
  echo "Node.js not found, installing..."
  curl -fsSL https://rpm.nodesource.com/setup_18.x | sudo -E bash -
  sudo yum install -y nodejs
fi


echo ">>> Installing npm dependencies..."
npm install --production

echo ">>> [CodeDeploy] install.sh completed successfully."