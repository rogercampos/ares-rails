# frozen_string_literal: true

module Ares
  module Rails
    class CronsController < ActionController::Base
      def show
        name = params[:id]
        entry = Ares.entries[name]

        unless entry
          head :not_found
          return
        end

        entry[:block].call
        head :ok
      end
    end
  end
end
