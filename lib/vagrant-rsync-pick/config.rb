module VagrantPlugins
  module RsyncPick
    class Config < Vagrant.plugin(2, :config)
      SECTION_NAME = "rsync_pick"

      attr_accessor :guest_dir, :host_dir

      def initialize
        # @guest_dir = UNSET_VALUE
        # @host_dir = UNSET_VALUE
      end

      def validate(machine)
        errors = _detected_errors
        unless @guest_dir && @host_dir
          errors << "Both values: guest_dir and host_dir are required"
        end

        { SECTION_NAME => errors }
      end
    end
  end
end
