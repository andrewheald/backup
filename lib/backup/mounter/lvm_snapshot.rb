# encoding: utf-8

module Backup
  module Mounter
    class LvmSnapshot < Base

      ##
      # Size of snapshot
      attr_accessor :size

      ##
      # Name of snapshot
      attr_accessor :name

      ##
      # Instantiates a new RSync::Push or RSync::Pull Syncer object.
      # Default configuration values and any specified in
      # Backup::Configuration::Syncer::RSync::[Push/Pull] are set from Base.
      # The user's configuration file is then evaluated to overwrite
      # these values or provide additional configuration.
      def initialize(&block)
        super

        @size               ||= 500
        @name               ||= 'snapshot'

        instance_eval(&block) if block_given?
      end

      ##
      # Performs the mount
      def mount!
        Logger.message(
          "#{ mounter_name } started mounting\n\s\s"
        )
      end

      ##
      # Performs the unmount
      def unmount!
        Logger.message(
          "#{ mounter_name } started unmounting\n\s\s"
        )
      end

      private

      ##
      # Return @path with any preceeding "~/" removed
      def dest_path
        @dest_path ||= @path.sub(/^\~\//, '')
      end
    end
  end
end
