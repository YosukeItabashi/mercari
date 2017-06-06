Item.seed do |s|
  s.id = 1
  s.name = "あめ"
  s.image = "aaa.img"
  s.description = "オススメ商品です。"
  s.state = "新品、未使用"
  s.postage = "送料込み"
  s.region = "北海道"
  s.shipping_date = "2〜3日"
  s.price = "1000"
  s.saler_id = 1
  s.buyer_id = 2
end

Item.seed do |s|
  s.id = 2
  s.name = "かさ"
  s.image = "aaa.img"
  s.description = "いい商品です。"
  s.state = "新品、未使用"
  s.postage = "送料込み"
  s.region = "北海道"
  s.shipping_date = "2〜3日"
  s.price = "800"
  s.saler_id = 3
  s.buyer_id = 4
end

Item.seed do |s|
  s.id = 3
  s.name = "ぬいぐるみ"
  s.image = "aaa.img"
  s.description = "すばらしい商品です。"
  s.state = "新品、未使用"
  s.postage = "送料込み"
  s.region = "北海道"
  s.shipping_date = "2〜3日"
  s.price = "1200"
  s.saler_id = 1
end
