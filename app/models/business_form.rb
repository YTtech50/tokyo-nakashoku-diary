class BusinessForm < ActiveHash::Base
    self.data = [
      { id: 1, name: '--' },
      { id: 2, name: '実店舗' },
      { id: 3, name: '移動式店舗・屋台' },
      { id: 4, name: 'デリバリー' }
    ]

    include ActiveHash::Associations
    has_many :foods

    end