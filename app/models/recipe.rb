class Recipe < ApplicationRecord
  # Direct associations

  has_many   :elements,
             :class_name => "Ingredient",
             :dependent => :destroy

  has_many   :steps,
             :dependent => :destroy

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
