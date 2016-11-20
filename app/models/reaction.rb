class Reaction < ActiveRecord::Base
  belongs_to :story
  belongs_to :user

  # TODO: Add Enums for Feelings, validate against that
end
