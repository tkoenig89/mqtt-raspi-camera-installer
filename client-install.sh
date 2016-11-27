SOURCE_ROOT=../
REPO_FOLDER=mqtt-raspicam
TARGET_LOCATION=/usr/mqtt-raspicam
TARGET_CFG_LOCATION=/etc/mqtt-raspicam
IMAGE_BASEFOLDER=/mnt/usb/images
CURRENT_DIR=$PWD

#install node and imagemagic
./client-prerequisits.sh

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

cp -r $REPO_FOLDER $TARGET_LOCATION
cd $TARGET_LOCATION
npm install
cd $CURRENT_DIR