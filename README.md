# Hubot

This is [Envato](http://webuild.envato.com/)'s Hubot puppet module. Unlike
[jfryman's puppet-hubot](https://github.com/jfryman/puppet-hubot), this module
assumes that you have a repo setup that already describes your npm
dependencies and hubot scripts, much like you would for a deployment to
Heroku.

## Dependencies

See the [Modulefile](Modulefile)

## Usage

```puppet
class { 'hubot':
  repo_url => 'git@github.com/myorganization/hubot.git',
  repo_ref => 'master',
  env_vars => { 'HUBOT_IRC_SERVER' => 'irc.example.com',
                'HUBOT_IRC_NICK'   => 'hubot' },
}
```
