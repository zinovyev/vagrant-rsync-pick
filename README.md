# vagrant-rsync-pick

The plugin allows you to pick atomic changes from the guest machine folder via rsync.

The `rsync` shared folder type is much faster (10x times maybe)
than nfs/virtualbox/smb and others.

But it has one huge disadvantage: it isn't possible to sync data
in a bidirectional way at all. So when you generate a new migration
or rake task for example your changes are kept on your guest machine only.

## Installation

    $ vagrant plugin install vagrant-rsync-pick

And then configure your guest directory (where the files are taken from)
and your host directory (where the files are stored to):

```ruby
  config.rsync_pick.guest_dir = "/var/www/my-app"
  config.rsync_pick.host_dir = Dir.pwd
```

## Usage

Execute this command so the file(s) is(are) rsynced to you host folder:

    $ vagrant rpick db/migrate/20100825634193_create_table.rb

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/zinovyev/vagrant_rsync_pick. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the VagrantRsyncPick project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/vagrant_rsync_pick/blob/master/CODE_OF_CONDUCT.md).
