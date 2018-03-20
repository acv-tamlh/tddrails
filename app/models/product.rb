class Product < ApplicationRecord
  validates :title, :description, :price, presence: true
  validates_numericality_of :price, greater_than: 0
  before_save :strip_html_description
  belongs_to :category

  def strip_html_description
    self.description = ActionView::Base.full_sanitizer.sanitize(self.description)
  end
end
