REPO_FOLDER=mqtt-raspicam
EXECUTABLE=/usr/local/bin/mqtt-raspicam
TARGET_LOCATION=/usr/mqtt-raspicam
TARGET_CFG_LOCATION=/etc/mqtt-raspicam
IMAGE_BASEFOLDER=/mnt/usb/images
CURRENT_DIR=$PWD

#install node and imagemagic
./prerequisits.sh

#checkout mqtt-raspi-camera repo
git clone https://github.com/tkoenig89/mqtt-raspi-camera.git $REPO_FOLDER

#create image folders
mkdir $IMAGE_BASEFOLDER
mkdir $IMAGE_BASEFOLDER/history

#install configuration file
sudo mkdir $TARGET_CFG_LOCATION
sudo chown -R pi:root $TARGET_CFG_LOCATION
sudo chmod -R 775 $TARGET_CFG_LOCATION

cp $REPO_FOLDER/config.json $REPO_FOLDER/mqtt-config.json $TARGET_CFG_LOCATION

#install application
sudo mkdir $TARGET_LOCATION
sudo chown -R pi:root $TARGET_LOCATION
sudo chmod -R 775 $TARGET_LOCATION

#copy the application and load node_modules via npm
cp -r $REPO_FOLDER/modules $REPO_FOLDER/package.json $REPO_FOLDER/index.js $REPO_FOLDER/scripts $TARGET_LOCATION
cd $TARGET_LOCATION
npm install
cd $CURRENT_DIR

NODE_PATH=$(which node)

#create a shortcut executable
echo "$NODE_PATH $TARGET_LOCATION $TARGET_CFG_LOCATION/config.json $TARGET_CFG_LOCATION/mqtt-config.json" > tempexecutable
chmod +x tempexecutable
sudo cp tempexecutable $EXECUTABLE
rm tempexecutable

#add cron.d file
sudo cp assets/mqttcam_cron /etc/cron.d

#open config files for editing
nano $TARGET_CFG_LOCATION/config.json
nano $TARGET_CFG_LOCATION/mqtt-config.json
