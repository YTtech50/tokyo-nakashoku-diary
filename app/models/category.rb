class Category < ActiveHash::Base
    self.data = [
      { id: 1, name: '--' },
      { id: 2, name: 'チェーン系ファストフード' },
      { id: 3, name: 'カフェ' },
      { id: 4, name: 'フレンチ' },
      { id: 5, name: 'イタリアン' },
      { id: 6, name: 'スペイン・ポルトガル' },
      { id: 7, name: 'その他の西洋料理(アメリカ、メキシコ、北欧など)' },
      { id: 8, name: '寿司' },
      { id: 9, name: 'うどん・そば' },
      { id: 10, name: 'その他の和食' },
      { id: 11, name: '中華' },
      { id: 12, name: 'その他のアジア料理(韓国、タイ、ベトナムなど)' },
      { id: 13, name: '無国籍・創作' }
    ]

    include ActiveHash::Associations
    has_many :foods

    end