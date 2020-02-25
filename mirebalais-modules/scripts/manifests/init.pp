class scripts (
$tomcat = hiera('tomcat'),
$archive_directory = decrypt(hiera('archive_folder')),
$sequence_directory = decrypt(hiera('sequence_folder'))

) {

file { "cleandiskspace":
    ensure => present,
    path    => '/usr/local/sbin/cleandiskspace.sh',
    mode    => '0700',
    owner   => 'root',
    group   => 'root',
    content => template('scripts/cleandiskspace.sh.erb'),
  }

cron { 'cleandiskspace':
    ensure  => present,
    user    => 'root',
    hour    => 19,
    minute  => 20,
    command => '/usr/local/sbin/cleandiskspace.sh >/dev/null 2>&1',
    environment => "MAILTO=${sysadmin_email}",
  }

}