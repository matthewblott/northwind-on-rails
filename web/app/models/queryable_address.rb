class QueryableAddress < ApplicationRecord
  include ViewBasedModel
  belongs_to :address
  scope :address_like, ->(query) { where('address LIKE ?', "%#{query}%") }
  
  def self.name_like(q)
    words = q.split
    len = words.length
   
    case len
      when 1
        addresses = address_like(words[0])
      when 2
        addresses = address_like(words[0]).or(address_like(words[1]))
      when 3
        addresses = address_like(words[0]).or(address_like(words[1])).or(address_like(words[2]))
      when 4
        addresses = address_like(words[0]).or(address_like(words[1])).or(address_like(words[2])).or(address_like(words[3]))
      when 5
        addresses = address_like(words[0]).or(address_like(words[1])).or(address_like(words[2])).or(address_like(words[3])).or(address_like(words[4]))
      else
        addresses = address_like(q)
    end

    addresses.uniq

  end

end
