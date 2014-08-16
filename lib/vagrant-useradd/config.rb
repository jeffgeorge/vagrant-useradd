module VagrantPlugins
  module Useradd
    # Configuration options
    class Config < Vagrant.plugin("2", "config")
      attr_accessor :users
      
      # Initialize override, setting config options default values
      # for merging
      def initialize
        super
        
        @users = UNSET_VALUE
      end
      
      # finalize! override, unseting config options
      def finalize!
        @users = nil if @users == UNSET_VALUE
      end
    end
  end
end