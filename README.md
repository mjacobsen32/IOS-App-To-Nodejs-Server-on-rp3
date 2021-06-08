# IOS App to Nodejs server - run simple shell commands from iphone!
This is a walkthrough tutorial that connects an IOS application to a node.js server running on a raspberry pi that allows the user to run 4 simple shell commands in the server folder: ```ls```, ```touch```, ```append``` (or ```>>```), and ```cat```. This tutorial uses node.js, express, Alamofire, and is written in javascript and swift

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
  * in server directory run ```npm init```
  * install express using ```npm install express```
* ### Get IP address (will only work on local network)
  * run ```ifconfig``` and write down ip address of ```inet``` in ```wlan0```
* ### Create server.js file
  * ```vim server.js```
* ### Run server
  * ```node server.js```

## ios App setup:
* ### create blank application
  * default simple app with Storyboard and without CoreData (Apples database)
* ### install AlamoFire dependency
  * ```file``` > ```Swift Packages``` > ```Add Package Dependency``` > https://github.com/Alamofire/Alamofire
* ### create 4 UIButton's for each command (ls, cat, append, touch) using Xcode GUI
  * ctrl-drag 4 buttons to ```ViewController``` class to create an action function
  * label buttons with default UIButton settings
* ### create 2 UITextFields for file name and append string using Xcode GUI
  * ctrl-drag 2 buttons to ```ViewController``` class to create an outlet variable
  * label variable with default UITextField settings
* ### create 1 UILabel to dispay data from server using Xcode GUI
  * ctrl-drag label to ```ViewController``` class to create an outlet variable
  * label variable with default UILabel settings
 * ### create new file to store API Functions
   * ```file``` > ```New File``` > ```Swift File``` > ```APIFunctions```
   * copy and paste the following code in. Replace the 'X's with the IP address found on your raspberry pi
   * in line comments explain code
 ```
 //
//  APIFunctions.swift
//  Connect_To_Server
//
//  Created by Matthew Jacobsen on 6/6/21.
//

import Foundation
import Alamofire // using Alamofire

class APIFunctions {
    func ls(completion: @escaping (String) -> Void){ // ls function that will return string upon completion
        var ls_str: String = "" // string that will hold our data from the request
        AF.request("http://X.X.X.X:8081/ls").response { response in // Alamofire request to get data in utf-8 form
            ls_str = String(data: response.data!, encoding: .utf8)!
            completion(ls_str) // upon completion, return the string
        }
    }
    func cat(file: String, completion: @escaping (String) -> Void){ // cat function that will return string upon completion
        var cat_str: String = "" // string that will hold our data from the request
        AF.request("http://X.X.X.X:8081/cat/" + file).response { response in // Alamofire request to get data in utf-8 form
            cat_str = String(data: response.data!, encoding: .utf8)!
            completion(cat_str) // upon completion, return the string
        }
    }
    func vim(name: String){ // takes in string of file to create using 'touch'
        let addr = "http://X.X.X.X:8081/vim/" + name // path of creation
        AF.request(addr, method: .post).responseJSON { response in // alamofire request to server
            debugPrint(response) // print response if one
        }
    }
    func append(str: String,file: String){ // takes in string to append and file to append to
        let parameters = ["str": str, "file": file] // creating parameters to pass in body in request
        AF.request("http://X.X.X.X:8081/append", method: .post, parameters: parameters).responseJSON { response in
                                                // using post method, with parameters in JSON form
            debugPrint(response) // print response if one
        }
    }
}
```
