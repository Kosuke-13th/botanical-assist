class GrowthTime < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '春・秋が成長期' },
    { id: 3, name: '夏が成長期' },
    { id: 4, name: '冬が成長期' }
  ]

  include ActiveHash::Associations
  has_many :plants
end
