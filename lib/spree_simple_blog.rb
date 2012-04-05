require 'spree_core'

module SimpleBlogExtension

  class Engine < Rails::Engine

    def self.activate

      Spree::BaseController.class_eval do
        helper ArticlesHelper
      end

    end


    config.autoload_paths += %W(#{config.root}/lib)
    config.to_prepare &method(:activate).to_proc

  end
end
