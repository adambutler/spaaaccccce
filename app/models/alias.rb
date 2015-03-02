class Alias < ActiveRecord::Base
  validates_presence_of :original_url, :lengthened_url
  validates_uniqueness_of :original_url, :lengthened_url
  before_validation :generate_lengthened_url
  validates_format_of :original_url, with: /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix, multiline: true

  def full_lengthened_url
    "#{HOST}/#{lengthened_url}"
  end

  def self.format_url(url)
    unless url.start_with?("http")
      url = "http://" + url
    end
    return url
  end

  private

  def self.random_url
    CONFIG["quotes"].sample(5)
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
