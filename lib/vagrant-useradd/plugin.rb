module VagrantPlugins
  module Useradd
    # Plugin definition
    #
    class Plugin < Vagrant.plugin("2")
      name 'vagrant useradd'
            
      config 'useradd' do
        Config
      end
      
    end
  end
end