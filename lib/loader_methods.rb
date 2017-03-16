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
     .sort { |a, b| compare_depth_and_name(a, b) }
     .each { |file| require "#{ROOT}/#{file}" }
end

def compare_depth_and_name(a, b)
  result = a.scan(%r{/}).count <=> b.scan(%r{/}).count
  return result unless result.zero?
  a <=> b
end
