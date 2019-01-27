script 'install_something' do
    interpreter 'bash'
    user 'root'
    cwd '/tmp'
    code <<-EOH
    wget -q https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb
    sudo dpkg -i packages-microsoft-prod.deb
    sudo apt-get -y install apt-transport-https
    sudo apt-get update
    sudo apt-get -y install dotnet-sdk-2.1
    EOH
  end