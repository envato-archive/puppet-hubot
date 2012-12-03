# == Class: hubot
#
# Installs and configures a github-style hubot instance
#
# === Parameters
#
# [*repo_url*]
#  URL of the git repo to fetch your hubot from
#
# [*repo_ref*]
#  Git ref (branch name, revision, tag, ...) to fetch
#
# [*env_vars*]
#  A hash of environment variables to set for the hubot process
#  eg HUBOT_IRC_SERVER, etc.
#
# [*adapter*]
#  Name of the adapter to specify as `-a` to the hubot binary
#  eg 'irc'
#
# [*user*]
#  user to run hubot as
#
# [*group*]
#  group to run hubot as
#
# [*install_dir*]
#  Where to install hubot
#
# === Examples
#
#  class { 'hubot':
#    repo_url => 'git@github.com/myorganization/hubot.git',
#    repo_ref => 'master',
#    env_vars => { 'HUBOT_IRC_SERVER' => 'irc.example.com',
#                  'HUBOT_IRC_NICK'   => 'hubot', }
#  }
#
# === Authors
#
# David Goodlad <david@goodlad.net>
#
# === Copyright
#
# Copyright 2012 Envato / David Goodlad, unless otherwise noted.
#
class hubot (
  $repo_url,
  $repo_ref,
  $env_vars,
  $adapter     = 'irc',
  $user        = 'hubot',
  $group       = 'hubot',
  $install_dir = '/opt/hubot',
) {
  include stdlib
  include nodejs
  include git

  anchor { 'hubot::begin': }
  -> class { 'hubot::package':
    repo_url    => $repo_url,
    repo_ref    => $repo_ref,
    install_dir => $install_dir,
    user        => $user,
    group       => $group,
  }
  -> class { 'hubot::config':
    adapter     => $adapter,
    env_vars    => $env_vars,
    hubot_opts  => '',
    install_dir => $install_dir,
    user        => $user,
    group       => $group,
  }
  ~> class { 'hubot::service': }
  -> anchor { 'hubot::end': }
}
