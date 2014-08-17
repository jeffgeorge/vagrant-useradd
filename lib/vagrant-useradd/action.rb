module VagrantPlugins
  module Useradd
    # Action to add users & groups
    class Action
      include Vagrant::Action::Builtin

      # Constructor
      #
      # @param app [Action] Next middleware to call
      # @param env [Hash] Action environment
      # @return nil
      #
      def initialize(app, env)
        @app       = app
        @env       = env
      end
      
      # Call method of this middleware
      #
      # @param env [Hash] Action environment
      # @return nil
      #
      def call(env)
        # Figure out if we should even try adding stuff
        if @env[:machine] && @env[:machine].state.id != :poweroff && !@env[:machine].config.useradd.users.nil?
            @env[:machine].config.useradd.users.each do |user|
              # Check to see if this user has already been added
              if !@env[:machine].communicate.test("id #{user}")
                @env[:ui].info "vagrant-useradd - Adding user '#{user}'..."
                @env[:machine].communicate.sudo("useradd -M #{user}")
              end
            end 
        end
        @app.call(env)
      end
    end
  end
end