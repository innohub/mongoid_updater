module MongoidUpdater
  module Controller
    extend ActiveSupport::Concern

    included do
      before_filter :set_mongoid_updater
    end

    protected

    # Set the updater of the Model
    def set_mongoid_updater
      ::MongoidUpdater.updater = current_user if user_signed_in?
    end
  end
end
