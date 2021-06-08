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
* ### Install npm using package installer
* ### Setup NPM
* ### Get IP address (will only work on local network)
* ### Create server.js file
* ### Run server
