module VagrantPlugins
  module RsyncPick
    class Plugin < ::Vagrant.plugin("2")
      name "rsync-pick"
      description "Picks atomic changes from the guest machine folder via rsync"
      config "rsync_pick" do
        require_relative "config"
        Config
      end

      command "rsync-pick", primary: true do
        require_relative "command"
        Command
      end
    end
  end
end
