require "ares/rails/engine"
require "ares/rails/version"

module Ares
  module Rails
  end

  mattr_accessor :domain
  mattr_accessor :api_token
  mattr_accessor(:entries) { {} }

  def self.configure
    yield self
  end

  def self.entry(name, schedule, &block)
    self.entries[name.parameterize] = { name: name, schedule: schedule, block: block }
  end
end
