
# AL Challenge, Task 1
Create a Vagrantfile that creates a single machine using this box: 

https://vagrantcloud.com/puppetlabs/boxes/ubuntu-14.04-64-nocm

...and installs the latest released version of your chosen configuration management tool.

# Important Design Decisions
* only 1, picked Chef as I've used it for Proof of Concepts before. 

##Tested using:
* Vagrant 2.2.3
* VirtualBox 5.2.18
* MacOS 10.14.2

Run on an internet connected Mac, and type:

~~~
vagrant up
~~~

Success looks like:

~~~
Bringing machine 'proxy1' up with 'virtualbox' provider...
==> proxy1: Importing base box 'puppetlabs/ubuntu-14.04-64-nocm'...
==> proxy1: Matching MAC address for NAT networking...
==> proxy1: Checking if box 'puppetlabs/ubuntu-14.04-64-nocm' version '1.0.3' is up to date...
==> proxy1: Setting the name of the VM: task1_proxy1_1548456641663_64943
==> proxy1: Using hostname "proxy1" as node name for Chef...
==> proxy1: Vagrant has detected a configuration issue which exposes a
==> proxy1: vulnerability with the installed version of VirtualBox. The
==> proxy1: current guest is configured to use an E1000 NIC type for a
==> proxy1: network adapter which is vulnerable in this version of VirtualBox.
==> proxy1: Ensure the guest is trusted to use this configuration or update
==> proxy1: the NIC type using one of the methods below:
==> proxy1: 
==> proxy1:   https://www.vagrantup.com/docs/virtualbox/configuration.html#default-nic-type
==> proxy1:   https://www.vagrantup.com/docs/virtualbox/networking.html#virtualbox-nic-type
==> proxy1: Clearing any previously set network interfaces...
==> proxy1: Preparing network interfaces based on configuration...
    proxy1: Adapter 1: nat
    proxy1: Adapter 2: hostonly
==> proxy1: Forwarding ports...
    proxy1: 80 (guest) => 18080 (host) (adapter 1)
    proxy1: 22 (guest) => 2222 (host) (adapter 1)
==> proxy1: Running 'pre-boot' VM customizations...
==> proxy1: Booting VM...
==> proxy1: Waiting for machine to boot. This may take a few minutes...
    proxy1: SSH address: 127.0.0.1:2222
    proxy1: SSH username: vagrant
    proxy1: SSH auth method: private key
    proxy1: 
    proxy1: Vagrant insecure key detected. Vagrant will automatically replace
    proxy1: this with a newly generated keypair for better security.
    proxy1: 
    proxy1: Inserting generated public key within guest...
    proxy1: Removing insecure key from the guest if it's present...
    proxy1: Key inserted! Disconnecting and reconnecting using new SSH key...
==> proxy1: Machine booted and ready!
==> proxy1: Checking for guest additions in VM...
    proxy1: The guest additions on this VM do not match the installed version of
    proxy1: VirtualBox! In most cases this is fine, but in rare cases it can
    proxy1: prevent things such as shared folders from working properly. If you see
    proxy1: shared folder errors, please make sure the guest additions within the
    proxy1: virtual machine match the version of VirtualBox you have installed on
    proxy1: your host and reload your VM.
    proxy1: 
    proxy1: Guest Additions Version: 5.0.16
    proxy1: VirtualBox Version: 5.2
==> proxy1: Setting hostname...
==> proxy1: Configuring and enabling network interfaces...
==> proxy1: Mounting shared folders...
    proxy1: /vagrant => /Users/adrian/Source/github/alChallenge/task1
    proxy1: /tmp/vagrant-chef/0a15071c4111795d3b33208e3729a129/cookbooks => /Users/adrian/Source/github/alChallenge/task1/cookbooks
==> proxy1: Running provisioner: chef_solo...
    proxy1: Installing Chef (latest)...
==> proxy1: Generating chef JSON and uploading...
==> proxy1: Warning: Chef run list is empty. This may not be what you want.
==> proxy1: Running chef-solo...
==> proxy1: [2019-01-25T14:51:39-08:00] INFO: Started chef-zero at chefzero://localhost:1 with repository at /tmp/vagrant-chef/0a15071c4111795d3b33208e3729a129, /tmp/vagrant-chef
==> proxy1:   One version per cookbook
==> proxy1: Starting Chef Client, version 14.9.13
==> proxy1: [2019-01-25T14:51:39-08:00] INFO: *** Chef 14.9.13 ***
==> proxy1: [2019-01-25T14:51:39-08:00] INFO: Platform: x86_64-linux
==> proxy1: [2019-01-25T14:51:39-08:00] INFO: Chef-client pid: 2213
==> proxy1: [2019-01-25T14:51:39-08:00] INFO: The plugin path /etc/chef/ohai/plugins does not exist. Skipping...
==> proxy1: [2019-01-25T14:51:40-08:00] INFO: Run List is []
==> proxy1: [2019-01-25T14:51:40-08:00] INFO: Run List expands to []
==> proxy1: [2019-01-25T14:51:40-08:00] INFO: Starting Chef Run for proxy1
==> proxy1: [2019-01-25T14:51:40-08:00] INFO: Running start handlers
==> proxy1: [2019-01-25T14:51:40-08:00] INFO: Start handlers complete.
==> proxy1: resolving cookbooks for run list: []
==> proxy1: [2019-01-25T14:51:40-08:00] INFO: Loading cookbooks []
==> proxy1: Synchronizing Cookbooks:
==> proxy1: Installing Cookbook Gems:
==> proxy1: Compiling Cookbooks...
==> proxy1: [2019-01-25T14:51:40-08:00] WARN: Node proxy1 has an empty run list.
==> proxy1: Converging 0 resources
==> proxy1: [2019-01-25T14:51:40-08:00] INFO: Chef Run complete in 0.043574363 seconds
==> proxy1: 
==> proxy1: Running handlers:
==> proxy1: [2019-01-25T14:51:40-08:00] INFO: Running report handlers
==> proxy1: Running handlers complete
==> proxy1: 
==> proxy1: [2019-01-25T14:51:40-08:00] INFO: Report handlers complete
==> proxy1: Chef Client finished, 0/0 resources updated in 01 seconds
~~~