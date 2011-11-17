require 'mongoid_updater/updater'
require 'mongoid_updater/controller'

module MongoidUpdater
  def self.store
    Thread.current[:mongoid_updater] ||= {}
  end

  def self.updater
    store[:updater]
  end

  def self.updater=(value)
    store[:updater] = value
  end
end

ActionController::Base.send :include, MongoidUpdater::Controller
