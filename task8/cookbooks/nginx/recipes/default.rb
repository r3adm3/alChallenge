#set the hostname
hostname = node.name

#ensures nginx is installed as per distro package management
package 'nginx' do
  action :install
end

file "/etc/nginx/sites-enabled/default" do
  action :delete
end

file "/etc/nginx/conf.d/load-balancer.conf" do
  content "upstream dotnet {
    server localhost:5000; 
}

# This server accepts all traffic to port 80 and passes it to the upstream. 
# Notice that the upstream name and the proxy_pass need to match.

server {
 listen 80; 

 location / {
    proxy_pass http://dotnet;
    proxy_set_header Host $host;
 }
}"
end

#ensures nginx service is enabled and started
service 'nginx' do
  action [:enable, :restart]
end

