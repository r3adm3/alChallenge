
cookbook_file '/home/vagrant/app.tgz' do
    source 'app.tgz'
    owner 'vagrant'
    group 'vagrant'
    action :create
  end

script 'untar hello world and execute' do
    interpreter 'bash'
    user 'root'
    cwd '/home/vagrant/'
    code <<-EOH
    tar zxf app.tgz
    cd helloworldWebApp
    nohup dotnet run > /dev/null 2>&1 &
    EOH
  end