module MongoidUpdater
  module Updater
    extend ActiveSupport::Concern

    included do
      unless include? Mongoid::Versioning
        include Mongoid::Versioning
      end

      attr_accessible :updated_by_id, :updated_by_type, :version

      belongs_to :updated_by, :polymorphic => true

      before_create :record_updater
      before_update :record_updater
      before_destroy :record_updater
    end

    def record_updater
      updater = MongoidUpdater.updater
      unless updater.nil?
        self.updated_by = MongoidUpdater.updater
      end
    end

  end
end
