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
        hook.before(Vagrant::Action::Builtin::SyncedFolders, Action)
      end
    end
  end
end