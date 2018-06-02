class Recipe < ApplicationRecord
  # Direct associations

  has_many   :steps,
             :dependent => :destroy

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
