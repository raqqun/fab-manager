class Credit < ActiveRecord::Base
  belongs_to :creditable, polymorphic: true
  belongs_to :plan
  has_many :users_credits, dependent: :destroy

  validates :creditable_id, uniqueness: { scope: [:creditable_type, :plan_id] }
  validates :hours, numericality: { greater_than_or_equal_to: 0 }
end
