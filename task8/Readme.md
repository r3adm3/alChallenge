
# AL Challenge, Task 8
Extend the Vagrantfile to deploy this webapp to two additional vagrant machines and then configure the nginx to load balance between them.

## Notes on Design Decisions
Added in a page into helloworld app (http://host/home/chuck) which displays random chuck norris quotes. 
Added in two web servers web2 and web3
lsof test that worked on nginx, doesn't appear to work with dotnet core. 
replaced simple test with a wget to check if the website on each of the webs is there

## Tested using

* Vagrant 2.2.3
* VirtualBox 5.2.18
* MacOS 10.14.2

Run on an internet connected Mac, and type:

~~~
vagrant up
~~~

Test for success by hitting http://localhost:18080 on the host machine. 