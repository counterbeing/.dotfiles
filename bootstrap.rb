#! /usr/bin/env ruby

require 'pry'
require 'fileutils'

ROOT = File.expand_path File.dirname(__FILE__)

# rubocop:disable all
module Tty extend self 
  def blue; bold 34; end
  def white; bold 39; end
  def red; underline 31; end
  def reset; escape 0; end
  def bold n; escape "1;#{n}" end
  def underline n; escape "4;#{n}" end
  def escape n; "\033[#{n}m" if STDOUT.tty? end
end
# rubocop:enable all

def require_recursively(folder)
  Dir.glob("#{folder}/**/*.rb")
     .sort { |a, b| a.scan(%r{/}).count <=> b.scan(%r{/}).count }
     .each { |file| require_relative file }
end

require_recursively('lib')
require_relative('links/10_create_links.rb')
require_recursively('osx')
require_recursively('vim')

binding.pry
'hi'

