class dockerup::installdocker  {
  $package_list = [ 'yum-utils', 'device-mapper-persistent-data', 'lvm2' ]
  $arch_name = 'Docker CE Stable - $basearch'
  
  package { $package_list: 
    ensure => 'installed' 
  }
  
 # configure the repo we want to use
  yumrepo { 'docker11':
    enabled  => 1,
    descr    => 'Local repo holding company application packages',
    baseurl  => 'https://download.docker.com/linux/centos/7/x86_64/stable/',  
    gpgcheck => 0,
  #  gpgkey => 'https://download.docker.com/linux/centos/gpg'
  }

  package { 'docker-ce':
    ensure  => 'installed',
    require => Yumrepo['docker11'],
  }
  package {'wget':
  ensure => present,
  provider => 'yum',
#  install_options  => ['--disablerepo=epel'],
  }

}

