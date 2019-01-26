
# AL Challenge, Task 5
Make the solution idempotent so that re-running the provisioning step will not restart nginx unless changes have been made

## Notes on Design Decisions
Added an nginx config template file to show that running a provision is 
handled idempotently. Make changes to 

## Tested using:
* Vagrant 2.2.3
* VirtualBox 5.2.18
* MacOS 10.14.2

Run on an internet connected Mac, and type:

~~~
vagrant up
vagrant provision
make changes to cookbooks/nginx/templates/host-proxy1/nginx.conf.erb
vagrant provision
~~~

Success looks like
~~~
Bringing machine 'proxy1' up with 'virtualbox' provider...
==> proxy1: Importing base box 'puppetlabs/ubuntu-14.04-64-nocm'...
==> proxy1: Matching MAC address for NAT networking...
==> proxy1: Checking if box 'puppetlabs/ubuntu-14.04-64-nocm' version '1.0.3' is up to date...
==> proxy1: Setting the name of the VM: task5_proxy1_1548540879370_20107
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
    proxy1: /vagrant => /Users/adrian/Source/github/alChallenge/task5
    proxy1: /tmp/vagrant-chef/acc0bf6985291f847130d897839d371f/cookbooks => /Users/adrian/Source/github/alChallenge/task5/cookbooks
==> proxy1: Running provisioner: chef_solo...
    proxy1: Installing Chef (latest)...
==> proxy1: Generating chef JSON and uploading...
==> proxy1: Running chef-solo...
==> proxy1: [2019-01-26T14:15:32-08:00] INFO: Started chef-zero at chefzero://localhost:1 with repository at /tmp/vagrant-chef/acc0bf6985291f847130d897839d371f, /tmp/vagrant-chef
==> proxy1:   One version per cookbook
==> proxy1: Starting Chef Client, version 14.9.13
==> proxy1: [2019-01-26T14:15:33-08:00] INFO: *** Chef 14.9.13 ***
==> proxy1: [2019-01-26T14:15:33-08:00] INFO: Platform: x86_64-linux
==> proxy1: [2019-01-26T14:15:33-08:00] INFO: Chef-client pid: 2211
==> proxy1: [2019-01-26T14:15:33-08:00] INFO: The plugin path /etc/chef/ohai/plugins does not exist. Skipping...
==> proxy1: [2019-01-26T14:15:34-08:00] INFO: Setting the run_list to ["recipe[nginx]", "recipe[sudoConfig]"] from CLI options
==> proxy1: [2019-01-26T14:15:34-08:00] INFO: Run List is [recipe[nginx], recipe[sudoConfig]]
==> proxy1: [2019-01-26T14:15:34-08:00] INFO: Run List expands to [nginx, sudoConfig]
==> proxy1: [2019-01-26T14:15:34-08:00] INFO: Starting Chef Run for proxy1
==> proxy1: [2019-01-26T14:15:34-08:00] INFO: Running start handlers
==> proxy1: [2019-01-26T14:15:34-08:00] INFO: Start handlers complete.
==> proxy1: resolving cookbooks for run list: ["nginx", "sudoConfig"]
==> proxy1: [2019-01-26T14:15:34-08:00] INFO: Loading cookbooks [nginx@0.0.0, sudoConfig@0.0.0]
==> proxy1: Synchronizing Cookbooks:
==> proxy1: [2019-01-26T14:15:34-08:00] INFO: Storing updated cookbooks/sudoConfig/recipes/default.rb in the cache.
==> proxy1: [2019-01-26T14:15:34-08:00] INFO: Storing updated cookbooks/nginx/templates/host-proxy1/nginx.conf.erb in the cache.
==> proxy1: [2019-01-26T14:15:34-08:00] INFO: Storing updated cookbooks/nginx/recipes/default.rb in the cache.
==> proxy1:   
==> proxy1: - sudoConfig (0.0.0)
==> proxy1:   
==> proxy1: - nginx (0.0.0)
==> proxy1: Installing Cookbook Gems:
==> proxy1: Compiling Cookbooks...
==> proxy1: Converging 5 resources
==> proxy1: Recipe: nginx::default
==> proxy1:   
==> proxy1: * apt_package[nginx] action install
==> proxy1: [2019-01-26T14:15:40-08:00] INFO: apt_package[nginx] installed nginx at 1.4.6-1ubuntu3.9
==> proxy1: 
==> proxy1:     - install version 1.4.6-1ubuntu3.9 of package nginx
==> proxy1:   * service[nginx] action enable
==> proxy1:  (up to date)
==> proxy1:   
==> proxy1: * service[nginx] action start
==> proxy1:  (up to date)
==> proxy1:   
==> proxy1: * template[/etc/nginx/nginx.conf] action create
==> proxy1: [2019-01-26T14:15:40-08:00] INFO: template[/etc/nginx/nginx.conf] backed up to /var/chef/backup/etc/nginx/nginx.conf.chef-20190126141540.250781
==> proxy1: [2019-01-26T14:15:40-08:00] INFO: template[/etc/nginx/nginx.conf] updated file contents /etc/nginx/nginx.conf
==> proxy1:     
==> proxy1: - update content in file /etc/nginx/nginx.conf from 9492ca to c034b3
==> proxy1:     
==> proxy1: --- /etc/nginx/nginx.conf	2014-03-04 14:25:36.000000000 -0800
==> proxy1:     +++ /etc/nginx/.chef-nginx20190126-2211-tz9jws.conf	2019-01-26 14:15:40.245625000 -0800
==> proxy1:     @@ -1,77 +1,51 @@
==> proxy1:      user www-data;
==> proxy1:     -worker_processes 4;
==> proxy1:     +worker_processes auto;
==> proxy1:      pid /run/nginx.pid;
==> proxy1:     -
==> proxy1:      events {
==> proxy1:      	worker_connections 768;
==> proxy1:      	# multi_accept on;
==> proxy1:      }
==> proxy1:     -
==> proxy1:      http {
==> proxy1:     -
==> proxy1:      	##
==> proxy1:      	# Basic Settings
==> proxy1:      	##
==> proxy1:     -
==> proxy1:      	sendfile on;
==> proxy1:      	tcp_nopush on;
==> proxy1:      	tcp_nodelay on;
==> proxy1:      	keepalive_timeout 65;
==> proxy1:      	types_hash_max_size 2048;
==> proxy1:      	# server_tokens off;
==> proxy1:     -
==> proxy1:      	# server_names_hash_bucket_size 64;
==> proxy1:      	# server_name_in_redirect off;
==> proxy1:     -
==> proxy1:      	include /etc/nginx/mime.types;
==> proxy1:      	default_type application/octet-stream;
==> proxy1:     -
==> proxy1:      	##
==> proxy1:     +	# SSL Settings
==> proxy1:     +	##
==> proxy1:     +	ssl_protocols TLSv1 TLSv1.1 TLSv1.2; # Dropping SSLv3, ref: POODLE
==> proxy1:     +	ssl_prefer_server_ciphers on;
==> proxy1:     +	##
==> proxy1:      	# Logging Settings
==> proxy1:      	##
==> proxy1:     -
==> proxy1:      	access_log /var/log/nginx/access.log;
==> proxy1:      	error_log /var/log/nginx/error.log;
==> proxy1:     -
==> proxy1:      	##
==> proxy1:      	# Gzip Settings
==> proxy1:      	##
==> proxy1:     -
==> proxy1:      	gzip on;
==> proxy1:      	gzip_disable "msie6";
==> proxy1:     -
==> proxy1:      	# gzip_vary on;
==> proxy1:      	# gzip_proxied any;
==> proxy1:      	# gzip_comp_level 6;
==> proxy1:      	# gzip_buffers 16 8k;
==> proxy1:      	# gzip_http_version 1.1;
==> proxy1:     -	# gzip_types text/plain text/css application/json application/x-javascript text/xml application/xml application/xml+rss text/javascript;
==> proxy1:     -
==> proxy1:     +	# gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;
==> proxy1:      	##
==> proxy1:     -	# nginx-naxsi config
==> proxy1:     -	##
==> proxy1:     -	# Uncomment it if you installed nginx-naxsi
==> proxy1:     -	##
==> proxy1:     
==> proxy1: -
==> proxy1:     
==> proxy1: -	#include /etc/nginx/naxsi_core.rules;
==> proxy1:     
==> proxy1: -
==> proxy1: 
==> proxy1:     -	##
==> proxy1:     -	# nginx-passenger config
==> proxy1:     -	##
==> proxy1:     -	# Uncomment it if you installed nginx-passenger
==> proxy1:     -	##
==> proxy1:     -	
==> proxy1:     -	#passenger_root /usr;
==> proxy1:     -	#passenger_ruby /usr/bin/ruby;
==> proxy1:     -
==> proxy1:     -	##
==> proxy1:      	# Virtual Host Configs
==> proxy1:      	##
==> proxy1:     -
==> proxy1:      	include /etc/nginx/conf.d/*.conf;
==> proxy1:      	include /etc/nginx/sites-enabled/*;
==> proxy1:      }
==> proxy1:     -
==> proxy1:      
==> proxy1:      #mail {
==> proxy1:      #	# See sample authentication script at:
==> proxy1: 
==> proxy1: 
==> proxy1: Recipe: sudoConfig::default
==> proxy1:   
==> proxy1: * file[/etc/sudoers.d/20_admin] action create
==> proxy1: [2019-01-26T14:15:40-08:00] INFO: file[/etc/sudoers.d/20_admin] created file /etc/sudoers.d/20_admin
==> proxy1:     
==> proxy1: - create new file /etc/sudoers.d/20_admin
==> proxy1: [2019-01-26T14:15:40-08:00] INFO: file[/etc/sudoers.d/20_admin] updated file contents /etc/sudoers.d/20_admin
==> proxy1:     
==> proxy1: - update content in file /etc/sudoers.d/20_admin from none to 0cf549
==> proxy1:     
==> proxy1: --- /etc/sudoers.d/20_admin	2019-01-26 14:15:40.265625000 -0800
==> proxy1:     
==> proxy1: +++ /etc/sudoers.d/.chef-20_admin20190126-2211-fedue5	2019-01-26 14:15:40.265625000 -0800
==> proxy1:     @@ -1 +1,2 @@
==> proxy1:     +%admin ALL=(ALL) ALL
==> proxy1: [2019-01-26T14:15:40-08:00] INFO: file[/etc/sudoers.d/20_admin] mode changed to 440
==> proxy1:     
==> proxy1: - change mode from '' to '0440'
==> proxy1:   * file[/etc/sudoers.d/10_vagrant] action create
==> proxy1: [2019-01-26T14:15:40-08:00] INFO: file[/etc/sudoers.d/10_vagrant] backed up to /var/chef/backup/etc/sudoers.d/10_vagrant.chef-20190126141540.280751
==> proxy1: [2019-01-26T14:15:40-08:00] INFO: file[/etc/sudoers.d/10_vagrant] updated file contents /etc/sudoers.d/10_vagrant
==> proxy1:     
==> proxy1: - update content in file /etc/sudoers.d/10_vagrant from ce99b2 to 90a1ac
==> proxy1: 
==> proxy1:     (no diff)
==> proxy1: 
==> proxy1: 
==> proxy1: [2019-01-26T14:15:40-08:00] INFO: template[/etc/nginx/nginx.conf] sending reload action to service[nginx] (delayed)
==> proxy1: Recipe: nginx::default
==> proxy1: 
==> proxy1:   * service[nginx] action reload
==> proxy1: [2019-01-26T14:15:40-08:00] INFO: service[nginx] reloaded
==> proxy1:     
==> proxy1: - reload service service[nginx]
==> proxy1: 
==> proxy1: [2019-01-26T14:15:40-08:00] INFO: Chef Run complete in 6.036340416 seconds
==> proxy1: 
==> proxy1: Running handlers:
==> proxy1: [2019-01-26T14:15:40-08:00] INFO: Running report handlers
==> proxy1: Running handlers complete
==> proxy1: 
==> proxy1: [2019-01-26T14:15:40-08:00] INFO: Report handlers complete
==> proxy1: Chef Client finished, 5/7 resources updated in 07 seconds
==> proxy1: Running provisioner: shell...
    proxy1: Running: inline script
    proxy1: proxy1 nginx is running
Adrians-MacBook-Pro:task5 adrian$ 
Adrians-MacBook-Pro:task5 adrian$ vagrant provision
==> proxy1: Using hostname "proxy1" as node name for Chef...
==> proxy1: Running provisioner: chef_solo...
==> proxy1: Detected Chef (latest) is already installed
==> proxy1: Generating chef JSON and uploading...
==> proxy1: Running chef-solo...
==> proxy1: [2019-01-26T14:16:01-08:00] INFO: Started chef-zero at chefzero://localhost:1 with repository at /tmp/vagrant-chef/acc0bf6985291f847130d897839d371f, /tmp/vagrant-chef
==> proxy1:   One version per cookbook
==> proxy1: Starting Chef Client, version 14.9.13
==> proxy1: [2019-01-26T14:16:01-08:00] INFO: *** Chef 14.9.13 ***
==> proxy1: [2019-01-26T14:16:01-08:00] INFO: Platform: x86_64-linux
==> proxy1: [2019-01-26T14:16:01-08:00] INFO: Chef-client pid: 3231
==> proxy1: [2019-01-26T14:16:01-08:00] INFO: The plugin path /etc/chef/ohai/plugins does not exist. Skipping...
==> proxy1: [2019-01-26T14:16:02-08:00] INFO: Setting the run_list to ["recipe[nginx]", "recipe[sudoConfig]"] from CLI options
==> proxy1: [2019-01-26T14:16:02-08:00] INFO: Run List is [recipe[nginx], recipe[sudoConfig]]
==> proxy1: [2019-01-26T14:16:02-08:00] INFO: Run List expands to [nginx, sudoConfig]
==> proxy1: [2019-01-26T14:16:02-08:00] INFO: Starting Chef Run for proxy1
==> proxy1: [2019-01-26T14:16:02-08:00] INFO: Running start handlers
==> proxy1: [2019-01-26T14:16:02-08:00] INFO: Start handlers complete.
==> proxy1: resolving cookbooks for run list: ["nginx", "sudoConfig"]
==> proxy1: [2019-01-26T14:16:02-08:00] INFO: Loading cookbooks [nginx@0.0.0, sudoConfig@0.0.0]
==> proxy1: Synchronizing Cookbooks:
==> proxy1:   
==> proxy1: - nginx (0.0.0)
==> proxy1:   
==> proxy1: - sudoConfig (0.0.0)
==> proxy1: Installing Cookbook Gems:
==> proxy1: 
==> proxy1: Compiling Cookbooks...
==> proxy1: Converging 5 resources
==> proxy1: Recipe: nginx::default
==> proxy1:   
==> proxy1: * apt_package[nginx] action install
==> proxy1:  (up to date)
==> proxy1: 
==> proxy1:   * service[nginx] action enable
==> proxy1:  (up to date)
==> proxy1:   
==> proxy1: * service[nginx] action start
==> proxy1:  (up to date)
==> proxy1:   
==> proxy1: * template[/etc/nginx/nginx.conf] action create
==> proxy1:  (up to date)
==> proxy1: Recipe: sudoConfig::default
==> proxy1:   
==> proxy1: * file[/etc/sudoers.d/20_admin] action create
==> proxy1:  (up to date)
==> proxy1:   
==> proxy1: * file[/etc/sudoers.d/10_vagrant] action create
==> proxy1:  (up to date)
==> proxy1: [2019-01-26T14:16:02-08:00] INFO: Chef Run complete in 0.289048113 seconds
==> proxy1: 
==> proxy1: Running handlers:
==> proxy1: [2019-01-26T14:16:02-08:00] INFO: Running report handlers
==> proxy1: Running handlers complete
==> proxy1: [2019-01-26T14:16:03-08:00] INFO: Report handlers complete
==> proxy1: Chef Client finished, 0/6 resources updated in 01 seconds
==> proxy1: Running provisioner: shell...
    proxy1: Running: inline script
    proxy1: proxy1 nginx is running
Adrians-MacBook-Pro:task5 adrian$ vagrant provision
==> proxy1: Using hostname "proxy1" as node name for Chef...
==> proxy1: Running provisioner: chef_solo...
==> proxy1: Detected Chef (latest) is already installed
==> proxy1: Generating chef JSON and uploading...
==> proxy1: Running chef-solo...
==> proxy1: [2019-01-26T14:16:18-08:00] INFO: Started chef-zero at chefzero://localhost:1 with repository at /tmp/vagrant-chef/acc0bf6985291f847130d897839d371f, /tmp/vagrant-chef
==> proxy1:   One version per cookbook
==> proxy1: Starting Chef Client, version 14.9.13
==> proxy1: [2019-01-26T14:16:18-08:00] INFO: *** Chef 14.9.13 ***
==> proxy1: [2019-01-26T14:16:18-08:00] INFO: Platform: x86_64-linux
==> proxy1: [2019-01-26T14:16:18-08:00] INFO: Chef-client pid: 3620
==> proxy1: [2019-01-26T14:16:18-08:00] INFO: The plugin path /etc/chef/ohai/plugins does not exist. Skipping...
==> proxy1: [2019-01-26T14:16:19-08:00] INFO: Setting the run_list to ["recipe[nginx]", "recipe[sudoConfig]"] from CLI options
==> proxy1: [2019-01-26T14:16:19-08:00] INFO: Run List is [recipe[nginx], recipe[sudoConfig]]
==> proxy1: [2019-01-26T14:16:19-08:00] INFO: Run List expands to [nginx, sudoConfig]
==> proxy1: [2019-01-26T14:16:19-08:00] INFO: Starting Chef Run for proxy1
==> proxy1: [2019-01-26T14:16:19-08:00] INFO: Running start handlers
==> proxy1: [2019-01-26T14:16:19-08:00] INFO: Start handlers complete.
==> proxy1: resolving cookbooks for run list: ["nginx", "sudoConfig"]
==> proxy1: [2019-01-26T14:16:19-08:00] INFO: Loading cookbooks [nginx@0.0.0, sudoConfig@0.0.0]
==> proxy1: Synchronizing Cookbooks:
==> proxy1:   
==> proxy1: - sudoConfig (0.0.0)
==> proxy1: [2019-01-26T14:16:19-08:00] INFO: Storing updated cookbooks/nginx/templates/host-proxy1/nginx.conf.erb in the cache.
==> proxy1:   
==> proxy1: - nginx (0.0.0)
==> proxy1: Installing Cookbook Gems:
==> proxy1: Compiling Cookbooks...
==> proxy1: Converging 5 resources
==> proxy1: Recipe: nginx::default
==> proxy1:   
==> proxy1: * apt_package[nginx] action install
==> proxy1:  (up to date)
==> proxy1: 
==> proxy1:   * service[nginx] action enable
==> proxy1:  (up to date)
==> proxy1:   
==> proxy1: * service[nginx] action start
==> proxy1:  (up to date)
==> proxy1:   
==> proxy1: * template[/etc/nginx/nginx.conf] action create
==> proxy1: [2019-01-26T14:16:20-08:00] INFO: template[/etc/nginx/nginx.conf] backed up to /var/chef/backup/etc/nginx/nginx.conf.chef-20190126141620.094962
==> proxy1: [2019-01-26T14:16:20-08:00] INFO: template[/etc/nginx/nginx.conf] updated file contents /etc/nginx/nginx.conf
==> proxy1:     
==> proxy1: - update content in file /etc/nginx/nginx.conf from c034b3 to b0e5eb
==> proxy1:     
==> proxy1: --- /etc/nginx/nginx.conf	2019-01-26 14:15:40.245625000 -0800
==> proxy1:     
==> proxy1: +++ /etc/nginx/.chef-nginx20190126-3620-1tek4pf.conf	2019-01-26 14:16:20.090674000 -0800
==> proxy1:     @@ -7,7 +7,7 @@
==> proxy1:      }
==> proxy1:      http {
==> proxy1:      	##
==> proxy1:     -	# Basic Settings
==> proxy1:     +	# Basic Settings 2
==> proxy1:      	##
==> proxy1:      	sendfile on;
==> proxy1:      	tcp_nopush on;
==> proxy1: Recipe: sudoConfig::default
==> proxy1:   * file[/etc/sudoers.d/20_admin] action create
==> proxy1:  (up to date)
==> proxy1:   
==> proxy1: * file[/etc/sudoers.d/10_vagrant] action create
==> proxy1:  (up to date)
==> proxy1: [2019-01-26T14:16:20-08:00] INFO: template[/etc/nginx/nginx.conf] sending reload action to service[nginx] (delayed)
==> proxy1: Recipe: nginx::default
==> proxy1:   
==> proxy1: * service[nginx] action reload
==> proxy1: [2019-01-26T14:16:20-08:00] INFO: service[nginx] reloaded
==> proxy1:     
==> proxy1: - reload service service[nginx]
==> proxy1: 
==> proxy1: 
==> proxy1: [2019-01-26T14:16:20-08:00] INFO: Chef Run complete in 0.302869716 seconds
==> proxy1: 
==> proxy1: Running handlers:
==> proxy1: [2019-01-26T14:16:20-08:00] INFO: Running report handlers
==> proxy1: Running handlers complete
==> proxy1: 
==> proxy1: [2019-01-26T14:16:20-08:00] INFO: Report handlers complete
==> proxy1: Chef Client finished, 2/7 resources updated in 01 seconds
==> proxy1: Running provisioner: shell...
    proxy1: Running: inline script
    proxy1: proxy1 nginx is running
~~~
