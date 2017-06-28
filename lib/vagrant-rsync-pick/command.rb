require "vagrant"

module VagrantPlugins
  module RsyncPick
    class Command < ::Vagrant.plugin("2", :command)
      def execute
        puts "Hello World!"
      end
    end
  end
end
