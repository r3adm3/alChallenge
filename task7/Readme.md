
# AL Challenge, Task 7


## Notes on Design Decisions
Splitting up install of .net core and deployment of the web app into seperate recipes
Had problems with puppetlabs/ubuntu-14.04-64-nocm, switched to ubuntu/xenial64 to troubleshoot had no issues there to see if the next LTS version of ubuntu had issues..it didn't. 

Sat 26th Jan 23:17 Spent two hours in here trying to get .net core 2 and ubuntu 14.04 to play ball. Leaving it for now and changing over to Xenial...

Sun 27th Jan 22:00 Having issues getting nginx to forward to dotnet core app whilst running. Vagrant up does run at the moment, but no successful test running yet. webapp is running but not accessible to the host via nginx, webapp inside vagrant can be run with **curl -k https://localhost:5001**

## Tested using:
* Vagrant 2.2.3
* VirtualBox 5.2.18
* MacOS 10.14.2

Run on an internet connected Mac, and type:

~~~

~~~

Success looks like
~~~

~~~
