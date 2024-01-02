class Watering < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '乾いたら水をあげる 2、3日に1回' },
    { id: 3, name: '多めの水をあげる 1日に1回' },
    { id: 4, name: '少なめの水やり 1週間に1回' }
  ]

  include ActiveHash::Associations
  has_many :plants
end
