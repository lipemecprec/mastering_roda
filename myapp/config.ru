require File.expand_path("../myapp",  __FILE__)
require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

run Myapp.app