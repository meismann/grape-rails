class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def initialize(*args)
    super
    self.sageone_guid ||= SecureRandom.hex if self.class.attribute_names.include?('sageone_guid')
  end
end
