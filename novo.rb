#!/usr/bin/env ruby

def prompt(question, commands)
  print "#{question} (y/n): "
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


# Commands
rails = <<RR
echo '\n>> Instalando Ruby 1.8\n' && 
echo 'apt-get -y install ruby1.8 libxml-ruby1.8 libxml2-dev libxslt1-dev libreadline-ruby1.8 irb1.8 ruby1.8-dev ri1.8 rdoc1.8' &&
echo '\n>> Instalando RubyGems a partir do código-fonte\n' &&
echo 'wget -nv http://rubyforge.org/frs/download.php/57643/rubygems-1.3.4.tgz' && echo 'tar -xzf rubygems-1.3.4.tgz' && 
echo 'cd rubygems-1.3.4 && ruby setup.rb install && cd .. && rm -rf rubygems-1.3.4' && 
echo 'gem sources -a http://gems.github.com && gem update' &&
echo '\n>> Instalando Rails\n' &&
echo 'gem install rails'"
RR

git = <<GIT
echo '\n>> Instalando Git\n' &&
echo 'apt-get -y install git-core git-doc git-gui gitk'"
GIT

sqlite = <<SQ
echo '\n>> Instalando Sqlite\n' &&
apt-get -y install sqlite3 libsqlite3-ruby libsqlite3-dev libdbd-sqlite3-ruby libsqlite3-ruby &&
echo '\n>> Instalando a Gem do Sqlite\n' &&
gem install sqlite3-ruby"
SQ

mysql = <<MY
echo '\n>> Instalando MySql\n' &&
apt-get -y install mysql-client-5.0 mysql-server-5.0 mysql-admin python-mysqldb libmysql-ruby libmysqlclient15-dev mysql-query-browser &&
echo '\n>> Instalando a Gem do MySql\n' &&
gem install mysql
MY

postgres = <<PG
echo '\n>> Instalando Postgres\n' &&
apt-get -y install libpq-dev libpgsql-ruby pgadmin3 postgresql-8.3 postgresql-client-8.3 postgresql-client-common postgresql-common postgresql-contrib-8.3 &&
echo '\n>> Instalando a Gem do Postgres\n' &&
gem install postgres
PG

puts "Iniciando..."
prompt("Instalar Ruby e Rails?", rails)
prompt("Instalar Git?", git)
prompt("Instalar Sqlite?", sqlite)
prompt("Instalar MySql?", mysql)
prompt("Instalar PostGres?", postgres)




