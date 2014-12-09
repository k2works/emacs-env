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
  mode   00755
  action :create
end

if File.exists?("/home/vagrant/.emacs.d")
  %w{conf elisp elpa public_repos etc info other backups}.each do |dir|
    directory "/home/vagrant/.emacs.d/#{dir}" do
      owner  "vagrant"
      group  "vagrant"
      mode   00755
      action :create
    end
  end

  cookbook_file "/home/vagrant/.emacs.d/init.el" do
    source "emacs24/init.el"
    owner  "vagrant"
    group  "vagrant"
    mode 00644
  end

  remote_directory "/home/vagrant/.emacs.d/elisp/color-theme-6.6.0" do
    source "emacs24/elisp/color-theme-6.6.0"
    owner  "vagrant"
    group  "vagrant"
    mode 00755
  end

  %w{
    /home/vagrant/.emacs.d/elisp/color-theme-6.6.0
    /home/vagrant/.emacs.d/elisp/color-theme-6.6.0/theme
  }.each do |file_path|
    bash "change owner" do
      code <<-EOC
        chown -R vagrant #{file_path}
      EOC
    end

    bash "change group" do
      code <<-EOC
        chgrp -R vagrant #{file_path}
      EOC
    end

    bash "change mode" do
      code <<-EOC
      chmod -R 755 #{file_path}
      EOC
    end
  end

  %w{auto-install.el}.each do |elisp_file|
    cookbook_file "/home/vagrant/.emacs.d/elisp/#{elisp_file}" do
      source "emacs24/elisp/#{elisp_file}"
      owner  "vagrant"
      group  "vagrant"
      mode 00644
    end
  end

end
