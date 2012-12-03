class hubot::service {
  service { 'hubot':
    ensure => 'running',
    enable => true,
  }
}
