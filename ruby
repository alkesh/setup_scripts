#!/bin/bash
export http_proxy=http://proxy.intra.bt.com:8080
ruby_location=ftp://ftp.ruby-lang.org/pub/ruby/
ruby_file=ruby-1.8.7-p249.tar.gz
# older version of ruby 1.8.7 here for those that need it
# ruby_location=ftp://ftp.ruby-lang.org/pub/ruby/1.8/
# ruby_file=ruby-1.8.7-p174.tar.gz
rubygems_location=http://rubyforge.org/frs/download.php/60718/
rubygems_file=rubygems-1.3.5.tgz

# CentOS prerequisites
sudo yum install -y gcc zlib-devel readline-devel openssl-devel openssl

curl -o $ruby_file $ruby_location$ruby_file -x $http_proxy
tar xvfz $ruby_file
cd ${ruby_file%.tar.gz}
./configure
make
sudo make install
cd ext/openssl
ruby extconf.rb
make
sudo make install
cd ..

curl -L -o $rubygems_file $rubygems_location$rubygems_file -x $http_proxy
tar xvfz $rubygems_file
cd ${rubygems_file%.tgz}
sudo ruby setup.rb
