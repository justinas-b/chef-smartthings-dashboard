#
# Cookbook:: smartthings-dashboard
# Recipe:: grafana_configure
#
# Copyright:: 2019, The Authors, All Rights Reserved.

grafana_config 'grafana-config' do
  instance_name      'grafana'
  restart_on_upgrade 'true'
end

grafana_config_security 'grafana-security' do
  admin_user       node.default['grafana']['admin_username']
  admin_password   node.default['grafana']['admin_password']
  secret_key       node.default['grafana']['admin_secret']
  disable_gravatar false
end

template '/etc/grafana/provisioning/datasources/datasources.yaml' do
  source 'datasources.yaml.erb'
  owner 'root'
  mode '0644'
  action :create
  variables(
    name:     node.default['influxdb']['database_name'],
    database: node.default['influxdb']['database_name'],
    username: node.default['influxdb']['database_username'],
    password: node.default['influxdb']['database_password'],
    url:      'http://localhost:8086'
  )
end

service 'grafana-server' do
  subscribes :restart, 'template[/etc/grafana/provisioning/datasources/datasources.yaml]', :immediately
end
