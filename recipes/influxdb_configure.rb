#
# Cookbook:: smartthings-dashboard
# Recipe:: influxdb_configure
#
# Copyright:: 2019, The Authors, All Rights Reserved.

influxdb_database node.default['influxdb']['database_name'] do
  action :create
end

influxdb_user node.default['influxdb']['database_username'] do
  password node.default['influxdb']['database_password']
  databases [node.default['influxdb']['database_name']]
  action :create
end
