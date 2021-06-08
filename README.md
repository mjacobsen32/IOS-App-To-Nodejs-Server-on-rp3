# IOS_App_To_Node.js
This is a walkthrough tutorial that connects an IOS application to a node.js server running on a raspberry pi. This tutorial uses node.js, express, Alamofire, and is written in javascript and swift

ios app demonstration      |  server side output
-------------------------|-------------------------
<img src="https://github.com/mjacobsen32/IOS-App-To-Nodejs-Server-on-rp3/blob/main/low.gif" width="500" height="800">  |  <img src="https://github.com/mjacobsen32/IOS-App-To-Nodejs-Server-on-rp3/blob/main/med.gif" width="500" height="800">


## Server setup:
* ### Install nodejs on raspberry PI:
  * run ```uname -m``` to get os version
  * copy link of nodejs version compatible for os version from: https://nodejs.org/en/download/
  * wget copied link in ```server``` directory on rp3
  * unzip file using commmand ```tar -xzf <tar_file_here>```
  * mv file to ```/opt/bin``` using ```sudo mv <unzipped_file_here> /opt/node```
  * make dir ```/opt/bin``` using ```sudo mkdir /opt/bin```
  * create symbolic link to all files using ```sudo ln -s /opt/node/bin/* /opt/bin/
  * add ```/opt/bin``` to end of ```PATH``` at ```/etc/profile``` using ```sudo nano /etc/profile```
  * see if install worked properly using ```node -v``` (might need to reboot)
* ### Install npm using package installer
  * ```sudo apt-get install npm```
  * see if install worked properly using ```npm --version```
* ### Setup NPM
* ### Get IP address (will only work on local network)
* ### Create server.js file
* ### Run server
