node 'lightless' {
	
 # $soft=['java-1.7.0-openjdk','nano','htop','unzip','httpd']

	group { 'sudo':
    ensure  => 'present',
  }

  file { '/home/bjanssens':
    ensure  => 'directory',
  }

  user { 'bjanssens':
    ensure   => 'present',
    home     => '/home/bjanssens',
    password => 'somethingstronghere',
    groups   => 'sudo',
    shell    => '/bin/bash',
    require  => [
      Group['sudo'],
      File['/home/bjanssens'],
    ]
  }

  file { '/home/lightlessfilms':
    ensure  => 'directory',
  }

  user { 'lightlessfilms':
    ensure   => 'present',
    home     => '/home/lightl',
    password => 'somethingstronghere',
    groups   => 'sudo',
    shell    => '/bin/bash',
    require  => [
      Group['sudo'],
      File['/home/lightlessfilms'],
    ]
  }

  package { 'nano':
    ensure => present,
  }

  minecraft { 'minecraft-1.8.1':
    group       => 'somegroup',
    user        => 'someuser',
    user_home   => '/opt/minecraft',
    server_port => '25565',
    version     => '1.8.1',
    eula        => 'true',
  }

  minecraft { 'minecraft-1.8.1-creative':
    gamemode    => '1',
    server_port => '25566',
    version     => '1.8.1',
    eula        => 'true',
  }

  minecraft { 'minecraft-1.5.2':
    server_port => '25567',
    version     => '1.5.2',
  }
}