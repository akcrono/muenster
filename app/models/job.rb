class Job < ActiveRecord::Base
  belongs_to :company

  validates :title, presence: true
  validates :company, presence: true
  validates :description, length: { maximum: 5000 }

  def self.search(search)
  if search
    where 'title ILIKE ?', "%#{search}%"
  else
    all
  end
end

end
