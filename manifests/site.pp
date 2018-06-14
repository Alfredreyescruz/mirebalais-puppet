Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/', '/usr/local/bin/' ] }

node default {

  class { 'apt':
    always_apt_update => true,
  }

  include security
  include mailx
  include ntpdate
  include apt_upgrades
  include wget

  include java
  include mysql_setup
  include apache2
  include tomcat

  include openmrs
  include openmrs::initial_setup

}

node 'emr.hum.ht' {

  class { 'apt':
    always_apt_update => true,
  }

  include security
  include mailx
  include ntpdate
  include apt_upgrades
  include wget

  include java
  include mysql_setup
  include apache2
  include tomcat

  include openmrs
  include openmrs::initial_setup

  include mirth
  include mirth::channel_setup
  
  #include monitoring
  include logging

  include openmrs::backup
  include crashplan
  include mirebalais_reporting::production_setup
}

node 'humci.pih-emr.org' {
  
  class { 'apt':
    always_apt_update => true,
  }

  include security
  include mailx
  include ntpdate
  include apt_upgrades
  include wget

  include java
  include mysql_setup
  include tomcat
  include apache2

  include openmrs
  include openmrs::initial_setup

  #include mirth
  #include mirth::channel_setup
  
  #include monitoring
}


node 'emrtest.hum.ht', 'humdemo.pih-emr.org' {
  
  class { 'apt':
    always_apt_update => true,
  }

  include security
  include mailx
  include ntpdate
  include apt_upgrades
  include wget

  include java
  include mysql_setup
  include apache2
  include tomcat

  include openmrs
  include openmrs::initial_setup
  
  #include monitoring
  include logging
}

node 'reporting.hum.ht' {

  class { 'apt':
    always_apt_update => true,
  }

  include security
  include mailx
  include ntpdate
  include apt_upgrades
  include wget

  include java
  include mysql_setup
  include apache2
  include tomcat

  include openmrs
  include openmrs::initial_setup
  
  #include monitoring
  include logging 
	
  include mirebalais_reporting::reporting_setup 
}

node 'pleebo.pih-emr.org', 'thomonde.pih-emr.org', 'lacolline.pih-emr.org' {

  class { 'apt':
    always_apt_update => true,
  }

  include security
  include mailx
  include ntpdate
  include apt_upgrades
  include wget

  include java
  include mysql_setup
  include apache2
  include tomcat

  include openmrs
  include openmrs::initial_setup
  
  #include monitoring
  #include logging

  include openmrs::backup
  include crashplan
}

node 'hinche-server.pih-emr.org', 'cercalasource.pih-emr.org', 'belladere.pih-emr.org' {

  class { 'apt':
    always_apt_update => true,
  }

  include security
  include mailx
  include ntpdate
  include apt_upgrades
  include wget

  include java
  include mysql_setup
  include apache2
  include tomcat

  include openmrs
  include openmrs::initial_setup
  
  #include monitoring
  #include logging

  include openmrs::backup

  # Crashplan removed (May 2018)
  #include crashplan
}

node 'zltraining.pih-emr.org' {

  class { 'apt':
    always_apt_update => true,
  }

  include security
  include mailx
  include ntpdate
  include apt_upgrades
  include wget

  include java
  include mysql_setup
  include apache2
  include tomcat

  include openmrs
  include openmrs::initial_setup
}

node 'wellbody.pih-emr.org' {

  class { 'apt':
    always_apt_update => true,
  }

  include security
  include mailx
  include ntpdate
  include apt_upgrades
  include wget

  include java
  include mysql_setup
  include apache2
  include tomcat

  include openmrs
  include openmrs::initial_setup

  #include monitoring
  include logging

  include openmrs::backup
  include crashplan
}

node 'kouka.pih-emr.org', 'padi.pih-emr.org', 'ci.pih-emr.org', 'ami.pih-emr.org', 'ami-azure.pih-emr.org', 'lespwa.pih-emr.org' {

  class { 'apt':
    always_apt_update => true,
  }

  include security
  include mailx
  include ntpdate
  include apt_upgrades
  include wget

  include java
  include mysql_setup
  include apache2
  include tomcat

  include openmrs
  include openmrs::initial_setup
  
  #include monitoring
}

