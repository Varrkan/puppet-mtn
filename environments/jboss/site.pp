


# depencies

node vm12 {
include zip
include wget
include java
include mysql::server

#configuring mysql
mysql::db { 'guestbook':
  user => 'demo',
    password => 'demodemo',
      grant => ['ALL'],
        host => 'vm12',
        sql => '/opt/jboss-as-7.1.1.Final/standalone/deployments/guestbookapp/guestbookmysqldump.sql'
	}

class { 'jboss':
  install             => 'source',
  version             => '7'
	}

wget::fetch { "testapp":
    destination => '/tmp/guestbookapp.zip',
      timeout     => 0,
        verbose     => true, 
	 }

 exec { "unzip":
    cwd => '/tmp',
     command => "unzip guestbookapp.zip -d /opt/jboss-as-7.1.1.Final/standalone/deployments/",
      path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
        }

#installing and configuring nginx
class { 'nginx':}

nginx::resource::vhost { 'jboss':
  proxy => 'http://localhost:8080',
	}
	}