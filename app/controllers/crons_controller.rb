# frozen_string_literal: true

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
