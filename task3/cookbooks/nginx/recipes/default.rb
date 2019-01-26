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

