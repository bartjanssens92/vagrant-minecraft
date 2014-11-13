node 'lightless' {
	
  $soft=['java-1.7.0-openjdk','nano','unzip']

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

  package{ $soft:
    ensure => 'installed',
  }
}