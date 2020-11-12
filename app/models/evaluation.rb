class Evaluation < ActiveHash::Base
    self.data = [
      { id: 1, name: '--' },
      { id: 2, name: '５点：毎日でも購入したいくらい美味しい！！' },
      { id: 3, name: '４点：ぜひまた購入したい！' },
      { id: 4, name: '３点：機会があればまた購入しても良い' },
      { id: 5, name: '２点：２度目はないかな。' },
      { id: 6, name: '１点：購入したことを後悔している･･･' }
    ]

    include ActiveHash::Associations
    has_many :foods

    end