class Product < ApplicationRecord
  include Paperclip::Glue
  has_attached_file :image, style: { medium: "300x300>", thumb: "100x100>" }, default_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/300px-No_image_available.svg.png"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :title, :description, :price, presence: true
  validates_numericality_of :price, greater_than: 0
  validate :title_is_shorter_than_description



  before_save :strip_html_description, :to_lower_case_title
  belongs_to :category, optional: false

  def strip_html_description
    self.description = ActionView::Base.full_sanitizer.sanitize(self.description)
  end

  def to_lower_case_title
    self.title = title.downcase
  end

  def title_is_shorter_than_description
    return if title.blank? or description.blank?
    return errors.add(:description, 'cant be shorter than title') if description.length < title.length
    # if title.length > description.length
    #   errors.add(:description, 'cant be shorter than title')
    # end
  end
end
