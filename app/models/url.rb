class Url < ActiveRecord::Base
  validates :link, :presence => true
  validates :link, :uniqueness => true

  after_create :generate_short_url

  def generate_short_url
    self.short_link = rand(36**5).to_s(36)
    self.save!
  end

end
