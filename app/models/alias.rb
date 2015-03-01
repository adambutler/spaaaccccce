class Alias < ActiveRecord::Base
  validates_presence_of :original_url, :lengthened_url
  validates_uniqueness_of :original_url, :lengthened_url
  before_create :generate_lengthened_url

  private

  def self.random_url
    CONFIG["quotes"].sample(6)
  end

  def generate_lengthened_url
    self.lengthened_url = loop do
      lengthened_url = Alias.random_url.join("_")
      break lengthened_url unless Alias.exists?(lengthened_url: lengthened_url)
    end
  end
end
