class AgrochemicalTime < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '1ヶ月に一度は薬散' },
    { id: 3, name: '3ヶ月に一度は薬散' },
    { id: 4, name: '半年に一度は薬散（春・秋）' }
  ]

  include ActiveHash::Associations
  has_many :plants
end
