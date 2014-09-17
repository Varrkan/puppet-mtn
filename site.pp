# /etc/puppet/manifests/site.pp


## NTP       

node vm12 {

include ntp           
include mysql::server

mysql::db { 'test_mdb':
  user     => 'test_user',
  password => 'test_user',
  grant    => ['ALL'],
  host     => 'vm12'

}

}


