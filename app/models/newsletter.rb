class Newsletter < ActiveRecord::Base
  validates :email, presence: true, format: {with: /\A([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)\z/}
end
