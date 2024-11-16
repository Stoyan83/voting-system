class Choice < ApplicationRecord
  belongs_to :choosable, polymorphic: true
end
