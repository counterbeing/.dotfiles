#! /usr/bin/env ruby

require 'fileutils'
require './lib/methods.rb'

ROOT = File.expand_path File.dirname(__FILE__)
INSTALLED_APPLICATIONS = Dir.entries("/Applications").join('').gsub(' ', '-').downcase

module Tty extend self
  def blue; bold 34; end
  def white; bold 39; end
  def red; underline 31; end
  def reset; escape 0; end
  def bold n; escape "1;#{n}" end
  def underline n; escape "4;#{n}" end
  def escape n; "\033[#{n}m" if STDOUT.tty? end
end

unless `uname`.chomp == 'Darwin'
  abort "#{Tty.red}Sorry, your OS is not supported#{Tty.reset}"
end

def run_each_in_dir(dir)
  dir = ROOT + '/' + dir
  entries = Dir.glob(dir + '/*.rb')
  entries.sort!
  entries.each do |e|
    require(e)
  end
end

[
  'osx/brew',
  'osx/prefs',
  'links',
  'osx/rbenv',
  'node',
  'git',
  'vim',
  'osx/atom',
  'osx/mas'
].each do |folder|
  puts "#{Tty.blue}Configuring #{folder}...#{Tty.reset}"
  run_each_in_dir(folder)
end
