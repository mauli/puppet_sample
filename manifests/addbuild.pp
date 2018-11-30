class dockerup::addbuild  {

include 'docker'


#docker::image { 'edureka/new':
#  docker_file => 'https://backup-edureka.s3.ap-south-1.amazonaws.com/Dockerfile'
#}


package {'wget':
 ensure => present,
}

#wget::fetch { 'https://backup-edureka.s3.ap-south-1.amazonaws.com/Dockerfile':
#  destination => '/home/puppetAgent/',
#}

exec { "wget -O /home/vagrant/Dockerfile https://backup-edureka.s3.ap-south-1.amazonaws.com/Dockerfile":
  cwd     => "/var/tmp",
  creates => "/home/vagrant/dockerfile",
  path    => ["/usr/bin", "/usr/sbin"]
}
exec { "wget -O /home/vagrant/addressbook.war https://backup-edureka.s3.ap-south-1.amazonaws.com/addressbook.war":
  cwd     => "/var/tmp",
  creates => "/home/vagrant/addressbook.war",
  path    => ["/usr/bin", "/usr/sbin"]
}
docker::image { 'edureka/new':
  #docker_file => '/home/vagrant/Dockerfile',
  docker_dir  => '/home/vagrant',
  notify => docker::run['mycontainertest1'],

}
}
