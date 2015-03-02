class Alias < ActiveRecord::Base
  validates_presence_of :original_url, :lengthened_url
  validates_uniqueness_of :original_url, :lengthened_url
  before_validation :format_original_url
  before_validation :generate_lengthened_url
  validates :original_url, :url => true

  def full_lengthened_url
    "http://spaaaccccce.com/#{lengthened_url}"
  end

  private

  def self.random_url
    CONFIG["quotes"].sample(6)
  end

  def format_original_url
    url = original_url
    unless original_url.start_with?("http")
      original_url = "http://" + url
    end
  end

  def generate_lengthened_url
    self.lengthened_url = loop do
      lengthened_url = Alias.random_url.join("_")
      break lengthened_url unless Alias.exists?(lengthened_url: lengthened_url)
    end
  end

  def original_url_is_valid
    begin
      URI.parse(original_url)
    rescue URI::InvalidURIError
      errors.add(:base, 'The URL provided is not valid')
    end
  end
end
