module ApplicationConcern
  extend ActiveSupport::Concern

  included do
    default_scope { where(deleted_at: nil) }

    def soft_delete
      self.deleted_at = DateTime.current
      self.save
    end
  end
end