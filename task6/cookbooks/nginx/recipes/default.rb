#set the hostname
hostname = node.name

#ensures nginx is installed as per distro package management
package 'nginx' do
  action :install
end

#ensures nginx service is enabled and started
service 'nginx' do
  action [:enable, :start]
end

#enforce an nginx config, only reload if it changes on provision
template "/etc/nginx/nginx.conf" do   
  source "nginx.conf.erb"
  notifies :reload, "service[nginx]"
end