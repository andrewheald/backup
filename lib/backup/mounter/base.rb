# encoding: utf-8

module Backup
  module Mounter
    class Base
      include Backup::CLI::Helpers
      include Backup::Configuration::Helpers

      ##
      # Path to the mount point
      attr_accessor :path

      private

      def mounter_name
        self.class.to_s.sub('Backup::', '')
      end

    end
  end
end
