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

def all_classes
  ObjectSpace
    .each_object(Class)
    .select { |c| c.singleton_class.ancestors.include?(Bootstrapper) }
end

classes_to_be_run = all_classes
ran_classes = []

while classes_to_be_run.count > 0
  klass = classes_to_be_run.shift
  if klass.runnable?(ran_classes)
    klass.run
    ran_classes << klass
  else
    classes_to_be_run << klass
  end
end
