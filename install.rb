#!/usr/bin/env ruby

# from http://github.com/technomancy/dotfiles

require 'yaml'

if `whoami`.chomp != "root"
  puts "You must be root."
  exit 1
end

packs = YAML.load(File.read('packs.yml'))
gems = YAML.load(File.read('gems.yml'))

if !system "sudo apt-get install #{packs.join(' ')} -y"
  raise "Couldn't install packages"
end

# install rubygems
if !File.exist?('/usr/bin/gem')
  system "wget http://rubyforge.org/frs/download.php/45905/rubygems-1.3.1.tgz"
  system "tar zxf rubygems-1.3.1.tgz"
  system "cd rubygems-1.3.1/"
  system "sudo ruby setup.rb"
  system "sudo gem update --system"
end

system "sudo gem sources -a http://gems.github.com"
system "sudo gem install rails"
system "sudo gem install rake" # sometimes we get a false start
system "sudo gem install #{gems.join(' ')}"

