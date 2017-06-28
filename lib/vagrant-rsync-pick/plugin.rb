module VagrantPlugins
  module RsyncPick
    class Plugin < ::Vagrant.plugin("2")
      name "RsyncPick"
      command "rsync-pick" do
        require_relative "command"
        Command
      end
    end
  end
end
