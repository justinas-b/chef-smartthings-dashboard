#
# Author:: Justinas Balinskas
# Cookbook::  smartthings-dashboard
# Attributes:: default
# 

default['grafana']['admin_username'] = 'grafana_admin'
default['grafana']['admin_password'] = 'p@$$w0rd'
default['grafana']['admin_secret']   = 'p@$$w0rd'

default['influxdb']['database_name']     = 'SmartThings'
default['influxdb']['database_username'] = 'grafana'
default['influxdb']['database_password'] = 'p@ssw0rd'
