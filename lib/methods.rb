#! /usr/bin/env ruby
def which(cmd)
  exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']
  ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
    exts.each do |ext|
      exe = File.join(path, "#{cmd}#{ext}")
      return exe if File.executable?(exe) && !File.directory?(exe)
    end
  end
  nil
end

HOME = File.expand_path('~')
def backup(file)
  puts "backing up #{file}"
  FileUtils.mv(file, "#{file}_backup_#{Time.now.to_i}") if File.exist?(file)
end

# Check to see if the symlink even needs to be replaced
def symlink_already_matchs(source, target)
  File.readlink(target) == source if File.symlink?(target)
end

# Source is orginial file, target is where the link goes
def make_link_where_appropriate(source, target)
  if symlink_already_matchs(source, target)
    puts "#{target} is already set"
  else
    backup(target)
    FileUtils.symlink(source, target, verbose: true)
  end
end

def copy_file_with_backup(source, target)
  backup(target) if File.exist?(target)
  FileUtils.cp(source, target)
end
