class dockerup::addbuild  {

include 'docker'
#class { '::docker' :
#  manage_package              => true,
#  use_upstream_package_source => false,
#  package_engine_name         => 'docker-engine',
#  package_source_location     => 'https://download.docker.com/linux/centos/7/x86_64/stable/Packages/docker-ce-18.06.1.ce-3.el7.x86_64.rpm',
#  prerequired_packages        => [ 'glibc.i686', 'glibc.x86_64', 'sqlite.i686', 'sqlite.x86_64', 'device-mapper', 'device-mapper-libs', 'device-mapper-event-libs', 'device-mapper-event' ]
#}

#{'docker': 
# use_upstream_package_source => false,

#}


#docker::image { 'edureka/new':
#  docker_file => 'https://backup-edureka.s3.ap-south-1.amazonaws.com/Dockerfile'
#}

#exec { "download-${filename}":
#    command   => $file_path,
#    provider  => powershell,
#    onlyif    => "if(Test-Path -Path '${destination_directory}\\${filename}') { exit 1 } else { exit 0 }",
#    logoutput => true,
# }


#file{'/home/vagrant/':
#  mode => 0755,
#   ensure   => present,
#  source   => 'https://backup-edureka.s3.ap-south-1.amazonaws.com/addressbook.war',

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
}
docker::run { 'mycontainertest1':
  ensure  => 'present',
  image	=> 'edureka/new',
  ports => ['8091:8080'],
  command => 'curl 127.0.0.1:8080',
 # restart => 'always',
  expose => ['8080'],
#  command => '/bin/sh -c "while true; do echo test container sleep 1; done"',
}
}
