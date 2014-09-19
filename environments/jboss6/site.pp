


## jboss  

node vm12 {

include java           
include jboss
jboss::deploy { 'testweb.war': }
}


