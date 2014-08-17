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
          @env[:machine].config.useradd.users.each do |user,groups|
            # Check and add any missing groups
            if !groups.nil?
              groups.each do |group|
                if !@env[:machine].communicate.test("getent group #{group}")
                  @env[:ui].info "vagrant-useradd - Adding group '#{group}'..."
                  @env[:machine].communicate.sudo("groupadd #{group}")
                end
              end
            end
            
            # Check to see if this user has already been added
            if !@env[:machine].communicate.test("getent passwd #{user}")
              group_list = groups.nil? ? nil : " -G " + groups.join(",")
              @env[:ui].info "vagrant-useradd - Adding user '#{user}'..."
              @env[:machine].communicate.sudo("useradd#{group_list} -M #{user}")
            else
              if !groups.nil?
                group_list = groups.nil? ? nil : " -a " + groups.join(",")
                @env[:ui].info "vagrant-useradd - Adding groups to user '#{user}'..."
                @env[:machine].communicate.sudo("usermod#{group_list} #{user}")
              end
            end
          end 
        end
        @app.call(env)
      end
    end
  end
end