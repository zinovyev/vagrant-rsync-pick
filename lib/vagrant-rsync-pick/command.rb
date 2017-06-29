require "vagrant"

module VagrantPlugins
  module RsyncPick
    class Command < ::Vagrant.plugin("2", :command)
      attr_reader :argv, :opts

      class << self
        def synopsis
          "picks atomic changes from the guest machine folder via rsync"
        end
      end

      def initialize(argv, env)
        super
        init_options
      end

      def execute
        return unless file_path
        p command
        system command
      end

      private

      def command
        [
          "rsync",
          "-R",
          "-v",
          "-e",
          "\"#{ssh_options}\"",
          guest_path,
          host_path
        ].join(" ")
      end

      def ssh_options
        "ssh -i #{ssh_info[:private_key_path].first} -p #{ssh_info[:port]}"
      end

      def guest_path
        File.join(
          "#{ssh_info[:username]}@#{ssh_info[:host]}:#{guest_dir}",
          file_path
        )
      end

      def host_path
        File.join(host_dir, "/")
      end

      def file_path
        @argv[0]
      end

      def init_options
        opts = OptionParser.new do |o|
          o.banner = "Usage: vagrant rsync-pick relative/file/path"
        end
        parse_options(opts)
      end

      def host_dir
        config.send(Config::SECTION_NAME).host_dir || @env.root_path
      end

      def guest_dir
        config.send(Config::SECTION_NAME).guest_dir || "/"
      end

      def config
        return machine.config
      end

      def ssh_info
        return machine.ssh_info
      end

      def machine
        @machine ||= fetch_machine
      end

      def fetch_machine
        machine_name = @env.primary_machine_name.to_s
        with_target_vms([machine_name], single_target: true) do |machine|
          return machine
        end
      end
    end
  end
end
