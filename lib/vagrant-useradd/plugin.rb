module VagrantPlugins
  module Useradd
    # Plugin definition
    #
    class Plugin < Vagrant.plugin("2")
      name 'vagrant useradd'
            
      config 'useradd' do
        Config
      end
      
      action_hook :useradd_hook do |hook|
        hook.after(Vagrant::Action::Builtin::WaitForCommunicator, Action)
      end
    end
  end
end