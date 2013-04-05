#
# Cookbook Name:: chruby
# Recipe:: default
#
# Copyright (C) 2013 Daniel Nolte

include_recipe "ruby-build"
include_recipe "ruby-build::ruby"

unless File.exist? "/usr/local/bin/chruby-exec"

  directory "/tmp/setup-chruby" do
    owner  "root"
    group  "root"
    mode   0755
    action :create
  end

  cookbook_file "/tmp/setup-chruby/chruby-0.3.4.tar.gz" do
    backup false
    action :create_if_missing
  end

  execute "extract chruby" do
    cwd "/tmp/setup-chruby"
    command "tar xfz chruby-0.3.4.tar.gz"
  end

  execute "install chruby" do
    cwd "/tmp/setup-chruby/chruby-0.3.4"
    command "make install"
  end

  cookbook_file "/etc/profile.d/chruby.sh" do
    mode   0744
    backup false
    action :create_if_missing
  end

end
