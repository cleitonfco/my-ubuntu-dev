#!/usr/bin/env ruby

def prompt(question, commands)
  print "#{question}? (y/n): "
  input = gets.chomp
  while (input !~ /[yn]/) do
    print "#{question}? Digite (y) para Sim e (n) para Não: "
    input = gets.chomp
  end
  system commands if input == "y"
end

if `whoami`.chomp != "root"
  puts "Você deve usar esse script como um super usuário."
  exit 1
end

puts "Iniciando..."

rails = "echo 'Instalando Ruby 1.8' && 
echo 'apt-get -y install ruby1.8 libxml-ruby1.8 libxml2-dev libxslt1-dev libreadline-ruby1.8 irb1.8 ruby1.8-dev ri1.8 rdoc1.8' &&
echo 'Instalando RubyGems a partir do Codigo-fonte' &&
echo 'wget http://rubyforge.org/frs/download.php/57643/rubygems-1.3.4.tgz' && echo 'tar -xzf rubygems-1.3.4.tgz' && 
echo 'cd rubygems-1.3.4 && ruby setup.rb install && cd .. && rm -rf rubygems-1.3.4' && 
echo 'gem sources -a http://gems.github.com && gem update' &&
echo 'Instalando Rails' &&
echo 'gem install rails'"
prompt("Você deseja instalar Ruby e Rails?", rails)


git-core
ruby
g++
sun-java6-jre
sun-java6-plugin
locate
curl
imagemagick
libmagickwand-dev
libdbm-ruby
libdbi-ruby
sqlite3
libsqlite3-ruby
libsqlite3-dev
libdbd-sqlite3-ruby
libsqlite3-ruby
mysql-client-5.0
mysql-server-5.0
mysql-admin
python-mysqldb
libmysql-ruby
libmysqlclient15-dev
mysql-query-browser
libpq-dev
libpgsql-ruby
pgadmin3
postgresql-8.3
postgresql-client-8.3
postgresql-client-common
postgresql-common
postgresql-contrib-8.3

puts "Instalando libs basicas (programação)..."
system "apt-get -y install gcc build-essential zlib1g zlib1g-dev libxml-ruby libxml2 libxml2-dev libxslt1-dev libyaml-ruby libreadline-ruby libfcgi-ruby1.8 libreadline-ruby1.8 libruby1.8 libopenssl-ruby libzlib-ruby libruby"
system "apt-get -y install locate curl wget libruby-extras libncurses-ruby libcurses-ruby imagemagick libmagick9-dev"

puts "Instalando libs especificas do Ruby..."
system "apt-get -y install ruby ruby1.8 irb ruby1.8-dev ruby1.8 ri1.8 rdoc1.8 irb1.8"

puts "Instalando bancos de dados sqlite3, MySql e Postgres"
system "apt-get -y install libdbm-ruby libdbi-ruby sqlite3 libsqlite3-ruby libsqlite3-dev libdbd-sqlite3-ruby libsqlite3-ruby mysql-client-5.0 mysql-server-5.0 mysql-admin python-mysqldb libmysql-ruby libmysqlclient15-dev mysql-query-browser libpq-dev libpgsql-ruby pgadmin3 postgresql-8.3 postgresql-client-8.3 postgresql-client-common postgresql-common postgresql-contrib-8.3"

puts "Instalando Git..."
system "apt-get -y install git-core git-doc git-gui gitk"

puts "Instalando RubyGems 1.3.4 a partir do Codigo-fonte..."
system "wget http://rubyforge.org/frs/download.php/57643/rubygems-1.3.4.tgz && tar -xzf rubygems-1.3.4.tgz"
system "cd rubygems-1.3.4 && ruby setup.rb install"
system "cd .. && rm -rf rubygems-1.3.4"
system "gem sources -a http://gems.github.com"
system "gem update"

puts "Instalando algumas Gems..."
system "sudo gem install rails thin ZenTest passenger mysql postgres json authlogic rmagick json_pure rake hpricot mislav-will_paginate jchupp-is_paranoid thoughtbot-paperclip thoughtbot-shoulda faker notahat-machinist rspec rspec-rails cucumber webrat sqlite3-ruby"
                         json mysql passenger postgres rails rake ZenTest
                         rack thin
                         hpricot nokogiri authlogic rmagick json_pure mislav-will_paginate jchupp-is_paranoid thoughtbot-paperclip thoughtbot-shoulda faker notahat-machinist rspec rspec-rails cucumber webrat sqlite3-ruby
system "sudo gem install mongrel rack rcov capistrano capistrano-ext treetop ruby-debug github  launchy redgreen syntax vlad wirble twitter xmpp4r"

puts "Instalando alguns programas básicos..."
system "apt-get -y install pidgin-libnotify zsnes tree meld rcov msttcorefonts"

ttf-liberation ttf-mscorefonts-installer

Development::Install.prompt "Instalar Filezilla", "apt-get -y install filezilla"

@plugins_gedit = "apt-get -y install gedit-plugins python-webkitgtk python-pyinotify && 
git clone git://github.com/lexrupy/gmate.git && 
cd gmate && sh install.sh && cd .. && rm -rf gmate && 
git clone git://github.com/oliver/gedit-file-search.git && 
cp gedit-file-search/file-search.* ~/.gnome2/gedit/plugins/ && rm -rf gedit-file-search && 
git clone git://github.com/caironoleto/rspec_mate.git && 
cp rspec_mate/rspec_mate ~/.gnome2/gedit/plugins/ && cp rspec_mate/rspec_mate.gedit-plugin ~/.gnome2/gedit/plugins/ && rm -rf rspec_mate"
Development::Install.prompt "Instalar plugins do Gedit", @plugins_gedit

@mod_rails = "echo 'deb http://apt.brightbox.net hardy main' > /etc/apt/sources.list.d/brightbox.list && 
wget -q -O - http://apt.brightbox.net/release.asc | apt-key add - && 
apt-get update && 
apt-get -y install libapache2-mod-passenger"
Development::Install.prompt "Instalar mod_rails", @mod_rails

Development::Install.prompt "Instalar PHP5", "apt-get -y install php5 libapache2-mod-php5 php5-mysql phpmyadmin libapache2-mod-auth-mysql"

system "/etc/init.d/apache2 restart"

puts "Finalizando instalacao..."
print "Versão do Ruby: "
system "ruby -v"
print "Versão do RubyGems: " 
system "gem -v"
print "Versão do Rails: " 
system "rails -v"
puts "Finalizado!"

