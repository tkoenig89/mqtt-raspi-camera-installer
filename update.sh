REPO_FOLDER=mqtt-raspicam
TARGET_LOCATION=/usr/mqtt-raspicam
CURRENT_DIR=$PWD

#update itself
echo "updating itself:"
git pull

#update cron.d file
sudo cp assets/mqttcam_cron /etc/cron.d

#update repository
cd $REPO_FOLDER
echo "updating camera:"
git pull
cd $CURRENT_DIR

#update application
cp -r $REPO_FOLDER/modules $REPO_FOLDER/package.json $REPO_FOLDER/index.js $REPO_FOLDER/scripts $TARGET_LOCATION
cd $TARGET_LOCATION
npm install
cd $CURRENT_DIR