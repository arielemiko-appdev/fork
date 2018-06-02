class Ingredient < ApplicationRecord
  # Direct associations

  belongs_to :recipe,
             :counter_cache => :elements_count

  # Indirect associations

  # Validations

end
