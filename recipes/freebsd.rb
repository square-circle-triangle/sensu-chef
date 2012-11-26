#
# Cookbook Name:: sensu
# Recipe:: freebsd
#
# Copyright 2012, Alan Harper
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

package_options = ""

gem_package "sensu"

user "sensu" do
  system true
end

cookbook_file "/usr/local/etc/rc.d/sensu_client" do
  owner "root"
  group "wheel"
  mode "0555"
end

directory "/etc/sensu/plugins" do
  recursive true
  owner "sensu"
  group "wheel"
  mode "0755"
end

service "sensu_client" do
  action [:enable]
end