class Post < ApplicationRecord
  belongs_to :user

  enum  status: { neo: 0, old: 1 }
end
