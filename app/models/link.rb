class Link < ApplicationRecord
  before_save { self.short_url = SecureRandom.urlsafe_base64(6) }
end
