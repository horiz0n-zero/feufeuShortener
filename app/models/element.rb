class Element < ApplicationRecord

  validates :slug, uniqueness: true

  SLUG_IDENTIFIERS = "abcdefghijklmnopqrstuvwxy012345678ABCDEFGHIJKLMNOPQRSTUVWXY".freeze
  SLUG_IDENTIFIERS_SIZE = 59.freeze
  def self.next_slug
    id = Element.maximum(:id)
    unless id
      id = 1
    else
      id = id.next
    end
    result = ""
    while id > 0
      result << Element::SLUG_IDENTIFIERS[id % Element::SLUG_IDENTIFIERS_SIZE]
      id /= Element::SLUG_IDENTIFIERS_SIZE
    end
    return result
  end

  def self.increase_clic(url)
    element = Element.find_by(url: url)
    if element
      element.clics = element.clics + 1
      element.save
    end
  end

  def self.increase_popularity(url)
    element = Element.find_by(url: url)
    if element
      element.popularity = element.popularity + 1
      element.save
    end
  end

end
