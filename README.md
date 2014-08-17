# vagrant-useradd

_vagrant-useradd_ is a [Vagrant](http://vagrantup.com/) plugin that lets you inject arbitrary Unix users and groups into a Vagrant base box.

Why? Race conditions, mostly. I feel Vagrant boxes should just contain your environment and versionable configuration, not your actual application, data and state. So you should be able to completely blow out a Vagrant box, reload it, reprovision it, and be back to a steady-state.

I've accomplished this in the past by mounting key data directories like Apache docroots and MySQL data directories outside of the box, so they don't fill up virtual disks and survive a rebuild . . . but that requires quite a bit of juggling, convincing core services to run as the user "vagrant" and various other equally terrible things.

However, if you could mount a data directory as Apache or MySQL most of these problems would conveniently disappear, but vboxfs mounts don't work if the guest doesn't already have the user or group present. So we need some way to forcibly inject users and groups before mounting. Thus, this module.

_Fair warning: This module is totally not ready for prime-time yet._

## Installation

_Sorry, it's manual right now._

- Clone the repo.
- Build it
```
$ rake build
```
- Install the gem as a vagrant plugin
```
$ vagrant plugin install pkg/vagrant-useradd*.gem
```

## Usage

_vagrant-useradd_ has two options for how you can define your userlist.

If you just need the default group matching the user's name, you can do:

```
config.useradd.users = ['apache','mysql']
```

If you need to define extra groups (like, Apache's 'www-data' group on Debian-based distros), you can build a hash:

```
config.useradd.users = {
  'apache' => ['www-data'],
  'mysql' => [],
  'somebody-else' => ['one','or-more','groups']
}
```

Note that group additions are *additive* only. If you need to remove a group that's up to you to fix.

## @TODO
- [x] Basic Functionality (adds users!)
- [x] Add Groups
- [x] Assign Groups
- [x] Comprehensive Docs _(Sort of...)_
- [ ] Publish to rubygems

## Contributing

1. Fork it
2. Hack on a branch
3. Send a Pull Request
