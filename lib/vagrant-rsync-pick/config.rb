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
        unless @guest_dir
          errors << "Config value rsync_pick.guest_dir is required"
          # errors << I18n.t("vagrant_rsync_pick.validation.guest_dir_required")
        end

        unless @host_dir
          errors << "Config value rsync_pick.host_dir is required"
          # errors << I18n.t("vagrant_rsync_pick.validation.host_dir_required")
        end

        { SECTION_NAME => errors }
      end
    end
  end
end
