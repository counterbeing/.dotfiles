#! /usr/bin/env ruby

require 'fileutils'
require './lib/methods.rb'

ROOT = File.expand_path File.dirname(__FILE__)

module Tty extend self
  def blue; bold 34; end
  def white; bold 39; end
  def red; underline 31; end
  def reset; escape 0; end
  def bold n; escape "1;#{n}" end
  def underline n; escape "4;#{n}" end
  def escape n; "\033[#{n}m" if STDOUT.tty? end
end


unless `uname`.chomp == "Darwin"
  abort "#{Tty.red}Sorry, your OS is not supported#{Tty.reset}"
end

def run_each_in_dir(dir)
  dir = ROOT + "/" + dir
  entries = Dir.glob(dir + '/*.rb')
  entries.sort!
  entries.each do |e|
    require(e)
  end
end

puts "#{Tty.blue}Installing brew. #{Tty.reset}"
run_each_in_dir("osx/brew")

puts "#{Tty.blue}Changing Mac OS and Application Preferences. #{Tty.reset}"
run_each_in_dir("osx/prefs")

puts "#{Tty.blue}Creating links to dotfiles in home dir. #{Tty.reset}"
run_each_in_dir("links")

puts "#{Tty.blue}Installing rubies... #{Tty.reset}"
run_each_in_dir("osx/rbenv")

puts "#{Tty.blue}Enabling .gitignore global. #{Tty.reset}"
run_each_in_dir("osx/git")

puts "#{Tty.blue}Installing powerline. #{Tty.reset}"
run_each_in_dir("osx/powerline")

puts "#{Tty.blue}Configuring Vim. #{Tty.reset}"
run_each_in_dir("vim")
