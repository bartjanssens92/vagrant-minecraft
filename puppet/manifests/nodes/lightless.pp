node 'lightless' {
	
  $soft=['java-1.7.0-openjdk','nano','unzip','lighttpd']

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

  # Enableing the epel repo
  yumrepo { 'epel.repo':
    name           => 'Epel',
    descr          => 'Extra Packages for Enterprise Linux 6',
    mirrorlist     => 'https://mirrors.fedoraproject.org/metalink?repo=epel-6&arch=$basearch',
    failovermethod => 'priority',
    enabled        => 1,
    gpgcheck       => 1,
    gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6',
  }

  package{ $soft:
    ensure => 'installed',
    require => Yumrepo['epel.repo'],
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