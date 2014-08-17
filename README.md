# vagrant-useradd

_vagrant-useradd_ is a [Vagrant](http://vagrantup.com/) plugin to let you inject Unix users and groups into a Vagrant base box.

Why? Race conditions, mostly. I feel Vagrant boxes should just contain your environment and versionable configuration, not your actual application, data and state. So you should be able to completely blow out a Vagrant box, reload it, reprovision it, and be back to a steady-state. I've accomplished this in the past by mounting key data directories like Apache docroots and MySQL data directories outside of the box, so they don't fill up virtual disks and survive a rebuild . . . but that requires quite a bit of juggling, convincing core services to run as the user "vagrant" or other equally terrible things.

However, if you could mount a data directory as Apache or MySQL, most of these problems would conveniently disappear, but vboxfs mounts don't work if the guest doesn't already have the user or group present. So we need some way to forcibly inject users and groups before mounting. Thus, this module.

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

Right now this module just reads a single config variable in your Vagrantfile:

```
config.useradd.users = ['apache','mysql']
```

That's it!

## @TODO
- [x] Basic Functionality (adds users!)
- [ ] Add Groups
- [ ] Assign Groups
- [ ] Comprehensive Docs
- [ ] Publish to rubygems

## Contributing

1. Fork it
2. Hack on a branch
3. Send a Pull Request
