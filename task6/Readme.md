
# AL Challenge, Task 6
Create a simple "Hello World" web application in your favourite language of choice.

## Notes on Design Decisions
Choosing .net core (c#) for hello world. Web server language I'm in most recently. 

## Tested using:
* dotnet core sdk 2.1.402 (https://dotnet.microsoft.com/download/thank-you/dotnet-sdk-2.1.402-macos-x64-installer)
* Vagrant 2.2.3
* VirtualBox 5.2.18
* MacOS 10.14.2

Run on an internet connected Mac, and type:

~~~
Once dotnet core installed, 
cd helloworldWebApp 
dotnet run
(dotnet run, compiles and executes application locally).
~~~

Success looks like
~~~
Using launch settings from /Users/adrian/Source/github/alChallenge/task6/helloworldWebApp/Properties/launchSettings.json...
: Microsoft.AspNetCore.DataProtection.KeyManagement.XmlKeyManager[0]
      User profile is available. Using '/Users/adrian/.aspnet/DataProtection-Keys' as key repository; keys will not be encrypted at rest.
Hosting environment: Development
Content root path: /Users/adrian/Source/github/alChallenge/task6/helloworldWebApp
Now listening on: https://localhost:5001
Now listening on: http://localhost:5000
Application started. Press Ctrl+C to shut down.
~~~

Open a browser and go to http://localhost:5000 or https://localhost:5001