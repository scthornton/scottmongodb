#
# Cookbook:: scottmongodb
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.


openssl_x509 '/etc/ssl/mongodb.crt' do
  common_name 'mongo'
  org 'mongo'
  org_unit 'Lab'
  country 'US'
  expire 752
end

bash 'concat_certificates' do
  code <<-EOL
  openssl pkcs8 -topk8 -inform PEM -outform PEM -nocrypt -in /etc/ssl/mongodb.key -out /etc/ssl/mongodb.key8
  cat /etc/ssl/mongodb.crt /etc/ssl/mongodb.key8 > /etc/ssl/mongodb.pem
  EOL
end

include_recipe 'mongodb3::default'
