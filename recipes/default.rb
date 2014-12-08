#
# Cookbook Name:: emacs-env
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
directory "/home/vagrant/.emacs.d" do
  owner  "vagrant"
  group  "vagrant"
  mode   00700
  action :create
end

if File.exists?("/home/vagrant/.emacs.d")
  %w{conf elisp elpa public_repos etc info other backups}.each do |dir|
    directory "/home/vagrant/.emacs.d/#{dir}" do
      owner  "vagrant"
      group  "vagrant"
      mode   00700
      action :create
    end
  end

  cookbook_file "/home/vagrant/.emacs.d/init.el" do
    source "emacs24/init.el"
    owner  "vagrant"
    group  "vagrant"
    mode 00644
  end

end
