class dockerup::run  {
docker::run { 'mycontainertest1':
  ensure  => 'present',
  image => 'edureka/new',
  ports => ['8091:8080'],
  expose => ['8080'],
}
}
