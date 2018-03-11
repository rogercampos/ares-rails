module Ares
  module Rails
    class Engine < ::Rails::Engine
      isolate_namespace Ares::Rails
    end
  end
end