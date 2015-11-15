#!/bin/bash
set -e

# check if cumulus user exists
getent passwd 'cumulus' > /dev/null 2>&1 && ret=true

if $ret; then
  echo "Found cumulus user. Continue with install"
else
  echo "Cumulus user not found. Check if user 'cumulus' exists"
  exit 1
fi

example_ospf_dir='/home/cumulus/git/example-ospfunnum-puppet'
git_dir='/home/cumulus/git'

if [ ! -d $example_ospf_dir ]; then
  echo "Git clone demo"
  git clone https://github.com/gchami/cumulus-vx-puppet.git $git_dir
fi

echo "Cd into /home/cumulus/example-ospfunnum-puppet"
cd $example_ospf_dir

echo "install puppet librarian"
bundle install

echo "execute librarian to install puppet modules"
librarian-puppet install

echo "symlink puppet files from ospfunnum-puppet dir to /etc/puppet"
dirlocs=(files manifests modules templates)

echo "remove puppet files in /etc/ that will be overriding"
for i in "${dirlocs[@]}"
do
  rm -rf /etc/puppet/$i
done

echo "create symlinks into ${example_ospf_dir}"
for i in "${dirlocs[@]}"
do
  ln -sf $example_ospf_dir/$i /etc/puppet/$i
done

echo "symlink site.pp to the relevant site.pp for this VX topopology"
ln -sf /etc/puppet/manifests/site-4l2s2h.pp /etc/puppet/manifests/site.pp

echo "copy license files"
cp -f /var/www/*.lic /etc/puppet/modules/base/files/

echo "change ownership of example-ospfunnum-puppet to cumulus"
chown -R cumulus:cumulus $example_ospf_dir

