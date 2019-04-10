#
# Cookbook:: smartthings-dashboard
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

include_recipe 'smartthings-dashboard::influxdb_install'
include_recipe 'smartthings-dashboard::influxdb_configure'
include_recipe 'smartthings-dashboard::grafana_install'
include_recipe 'smartthings-dashboard::grafana_configure'
