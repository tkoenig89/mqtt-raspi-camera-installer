REPO_FOLDER=mqtt-raspicam
TARGET_LOCATION=/usr/mqtt-raspicam
CURRENT_DIR=$PWD

#update itself
git pull

#update repository
cd $REPO_FOLDER
git pull
cd $CURRENT_DIR

#update application
cp -r $REPO_FOLDER/modules $REPO_FOLDER/package.json $REPO_FOLDER/index.js $REPO_FOLDER/scripts $TARGET_LOCATION
cd $TARGET_LOCATION
npm install
cd $CURRENT_DIR