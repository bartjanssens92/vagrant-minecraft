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

  package{ 'elasticsearch-1.4.0.noarch.rpm':
    provider => 'rpm',
    ensure   => 'installed',
    source   => '/vagrant_data/ELK/elasticsearch-1.4.0.noarch.rpm',
    require  => Package['java-1.7.0-openjdk'],
  }

  package{ 'logstash-1.4.2-1_2c0f5a1.noarch.rpm':
    provider => 'rpm',
    ensure   => 'installed',
    source   => '/vagrant_data/ELK/logstash-1.4.2-1_2c0f5a1.noarch.rpm',
    require  => Package['java-1.7.0-openjdk'],
  }
}