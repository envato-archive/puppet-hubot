class hubot::config (
  $hubot_opts  = '',
  $env_vars    = {},
  $adapter,
  $user,
  $group,
  $install_dir,
) {
  file { '/etc/default/hubot':
    ensure  => 'present',
    content => template('hubot/default.erb'),
    mode    => '0600',
  }

  file { '/etc/init.d/hubot':
    ensure  => 'present',
    content => template('hubot/hubot.init.erb'),
    mode    => '0755',
  }
}
