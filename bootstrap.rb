#! /usr/bin/env ruby

require 'fileutils'
require './lib/loader_methods'
require './lib/bootstrap_runner'

ROOT = File.expand_path File.dirname(__FILE__)

require_recursively('lib')
require_relative('links/10_create_links.rb')
require_recursively('osx')
require_recursively('vim')

BootstrapRunner.call
