# devops challenge

README.md
---------

devops.tgz contains all of the necessary files to create an web development 
environment based on Ubuntu 14.04 VMs managed using Vagrant and Chef. 

Solution has been tested on:
* Vagrant 2.2.3
* VirtualBox 5.2.18
* MacOS 10.14.2

To untar the solution save devops.tgz to a folder and on the command line type:

tar xfvz devops.tgz
~~~
.
├── Readme.md           <--- this file
├── task1               <--- code for task 1
│   ├── Readme.md       <--- readme.md for task 1
│   ├── Vagrantfile     <--- vagrant file for task 1
│   └── cookbooks       <--- empty cookbook folder ready for chef content
├── task2
│   ├── Readme.md
│   ├── Vagrantfile
│   └── cookbooks
│       └── nginx       <--- nginx cookbook
├── task3
│   ├── Readme.md
│   ├── Vagrantfile
│   └── cookbooks
│       └── nginx
├── task4
│   ├── Readme.md
│   ├── Vagrantfile
│   └── cookbooks
│       ├── nginx
│       └── sudoConfig  <--- sudoConfig cookbook
├── task5
│   ├── Readme.md
│   ├── Vagrantfile
│   └── cookbooks
│       ├── nginx
│       └── sudoConfig
├── task6
│   ├── Readme.md
│   ├── Vagrantfile
│   ├── cookbooks
│   │   ├── nginx
│   │   └── sudoConfig
│   └── helloworldWebApp <--- helloworldWebApp code 
│       ├── Controllers
│       ├── Models
│       ├── Program.cs
│       ├── Properties
│       ├── Startup.cs
│       ├── Views
│       ├── appsettings.Development.json
│       ├── appsettings.json
│       ├── bin
│       ├── helloworldWebApp.csproj
│       ├── obj
│       └── wwwroot
├── task7
│   ├── Readme.md
│   ├── Vagrantfile
│   ├── cookbooks
│   │   ├── dotnetCore      <--- dotnet core installer recipe
│   │   ├── nginx
│   │   ├── sudoConfig
│   │   └── webapp          <--- dotnet core webapp deployment recipe
│   ├── helloworldWebApp
│   │   ├── Controllers
│   │   ├── Models
│   │   ├── Program.cs
│   │   ├── Properties
│   │   ├── Startup.cs
│   │   ├── Views
│   │   ├── appsettings.Development.json
│   │   ├── appsettings.json
│   │   ├── bin
│   │   ├── helloworldWebApp.csproj
│   │   ├── obj
│   │   └── wwwroot
│   └── ubuntu-xenial-16.04-cloudimg-console.log
└── task8
    ├── Readme.md
    ├── Vagrantfile
    ├── cookbooks
    │   ├── dotnetCore
    │   ├── nginx
    │   ├── sudoConfig
    │   ├── testScript
    │   └── webapp
    ├── helloworldWebApp
    │   ├── Controllers
    │   ├── Models
    │   ├── Program.cs
    │   ├── Properties
    │   ├── Startup.cs
    │   ├── Views
    │   ├── appsettings.Development.json
    │   ├── appsettings.json
    │   ├── bin
    │   ├── helloworldWebApp.csproj
    │   ├── obj
    │   └── wwwroot
    └── ubuntu-xenial-16.04-cloudimg-console.log

~~~

To execute the configuration cd into any one of the task folders (where the vagrantfile is) and execute:

vagrant up

Task 8 provisions the four machines that match the requirements for all of the tasks, and uses chef solo to install and configure software, and shell scripts to test configuration

Here is the network diagram of what gets created:

~~~

                   +-----+ Virtualbox/Vagrant Host
                   |     |
                   |     |
                 +---------+
                 |         |
                 +---------+
                      |
                      |
                      | http://localhost:18080/
                      |
                      v  10.2.0.15
               +----------------+
               |    nginx       |       +-------+
               |    proxy1      <-------+ test1 |
               |                |       +-------+
               | 192.168.56.150 |         192.168.56.154
               +----------------+
                      |
             +--------v----------+
             |                   |
             |                   |
    +--------v-------+   +-------v------+
    | 192.168.56.152 |   |192.168.56.153|
    |                |   |              |
    |                |   |              |
    |      web2      |   |     web3     |
    +----------------+   +--------------+
~~~

Each box gets tested as it gets provisioned, Web2 and Web3 first to check nginx is serving web content. Then the nginx proxy to check
content is talking to both webs. (That test is performed from test1).

The messages to lookout for on the tests are:

    proxy1 serving content from both Web2 and Web3

The pages to hit to verify the challenges have been met are (and hit these from the Virtualbox/Vagrant host):

   http://localhost:18080/   <--- simple hello world

   http://localhost:18080/home/Chuck   <---- page with simple api call 

Please excuse the untidyness and lack of design on the dotnet core hello world, I was sacrificing a nice design for speed of getting something running. 

All of this is available on github, if the history of the source wants to be viewed at:

http://github.com/r3adm3/alChallenge

Solution took about 12h in code, 1h to document..

Improvements and compromises...
- Better commenting throughout the vagrantfile and chef cookbooks. The technologies though are reasonably high level and understandable, so didn't feel the need too much to document them. Its fairly simplistic use of chef and vagrant, its been a while in both technologies. 

- Use of shell script to test, took longer than i expected to pick up (I'm naturally more used to powershell, vbscript, javascript, c# and php). I did want something that was compatible with all linuxes and that I could reuse previous vagrant boxes setup already with the solution. I could have gone into Windows and got the testing scripts written quicker, but having looked over the past couple of days after submitting the final solution, its apparent Vagrant and Windows boxes (and particularly use of Chef inside them) is problematic at best. Not looked into use of Puppet instead in a similar situation. I thought it was a good balance of time vs knowledge with the final solution

- Dotnet Core usage was problematic at times and takes **ages** to spin up inside the web containers. If using docker, I'd make sure I'd use an image with dotnet core already in the image, and probably not use a *.tgz file to get the application code into the image. I'd just bake the app straight in and docker build at that point. Docker images with dotnet core apps a naturally smaller, and would provision quicker. (Problem there is we'd end up ditching the Desired State demonstration instead relying on immutable images instead to solve the problem) 
