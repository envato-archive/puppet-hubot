class hubot::package (
  $repo_url,
  $repo_ref,
  $user,
  $group,
  $install_dir,
) {
  group { $group:
    ensure => 'present',
  }

  user { $user:
    gid => $group,
  }

  vcsrepo { $install_dir:
    provider => 'git',
    source   => $repo_url,
    revision => $repo_ref,
    owner    => $user,
    group    => $group,
    require  => Package['git'],
  }

  exec { 'npm_install_hubot':
    command => '/usr/bin/npm install',
    cwd => $install_dir,
    refreshonly => true,
    subscribe => Vcsrepo[$install_dir],
    require => Package['npm'],
  }
}
