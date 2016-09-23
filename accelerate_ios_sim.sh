#!/bin/bash
accelerator_dir=`pwd`
accelerator_plist_file=${accelerator_dir}/com.apple.instruments.deviceservice.plist
launch_daemons_path=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk/Developer/Library/LaunchDaemons
original_plist_file=${launch_daemons_path}/com.apple.instruments.deviceservice.plist

cd ~
git clone https://github.com/lawrencelomax/instruments-without-delay.git
cd instruments-without-delay/
git checkout xcode7-quirks
./build.sh

# update accelerator_plist_file's lib root path as user folder
old_string={user_dir}
new_string=`echo $HOME`
sed -i -e "s%${old_string}%${new_string}%g" ${accelerator_plist_file}

# backup plist file
sudo cp ${original_plist_file} ${launch_daemons_path}/com.apple.instruments.deviceservice.plist-bkk
# remove the original plist file
sudo rm ${original_plist_file} 
# replace with the pre-configured plist file
sudo cp ${accelerator_plist_file} ${launch_daemons_path}

########## cleaning up ############

# go back to accelerator folder
cd ${accelerator_dir}
# reset pre-config plist file 
git checkout com.apple.instruments.deviceservice.plist
# rm temp file
rm com.apple.instruments.deviceservice.plist-*