class Story < ActiveRecord::Base
  belongs_to :value
  belongs_to :user
end
