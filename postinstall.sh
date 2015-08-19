# Avoid Mysql Installation Prompt
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password rapadura'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password rapadura'

# Language Settings
export LANGUAGE=pt_BR.UTF-8
export LANG=pt_BR.UTF-8
export LC_ALL=pt_BR.UTF-8
locale-gen en_US.UTF-8
locale-gen pt_BR.UTF-8

aptitude update && aptitude safe-upgrade -y

# Install basic unix packages
aptitude install -y \
  bash-completion \
  build-essential \
  curl \
  git \
  mysql-server-5.5 \
  libmysqlclient-dev \
  libxslt1-dev \
  libxml2-dev \
  libpq-dev \
  nodejs \
  nodejs-dev \
  tmux \
  vim \
  wget \
  rake \
  s3cmd \
  imagemagick \
  htop

# Remove default ruby
aptitude purge ruby -y

# Install rvm and ruby
su -c 'gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3' vagrant
su -c 'curl -sSL https://get.rvm.io | bash -s stable' vagrant
su -c '/home/vagrant/.rvm/bin/rvm reload' vagrant
su -c 'echo "export rvm_max_time_flag=20" >> ~/.rvmrc' vagrant
su -c '/home/vagrant/.rvm/bin/rvm install 2.2.0' vagrant
su -c '/home/vagrant/.rvm/bin/rvm use 2.2.0 --default' vagrant
su -c '/home/vagrant/.rvm/bin/rvm all do gem install bundle' vagrant

# Create mysql database
su -c "echo 'CREATE DATABASE sesai-pdsi' | mysql -u root -p'rapadura'"
