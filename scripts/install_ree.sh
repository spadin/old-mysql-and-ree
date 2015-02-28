wget --no-verbose http://rubyenterpriseedition.googlecode.com/files/ruby-enterprise-1.8.7-2011.12.tar.gz

tar xzvf ruby-enterprise-1.8.7-2011.12.tar.gz

export PREFIX=/opt/ruby-enterprise

pushd .

cd ruby-enterprise-1.8.7-2011.12/source/

./configure --prefix=$PREFIX --enable-mbari-api CFLAGS='-g -O2'

make

make install

echo 'export PATH="/opt/ruby-enterprise/bin:$PATH"' >> /etc/profile.d/ruby-enterprise.sh
source /etc/profile.d/ruby-enterprise.sh

popd

rm ruby-enterprise-1.8.7-2011.12.tar.gz
rm -r ruby-enterprise-1.8.7-2011.12

gem install bundler
