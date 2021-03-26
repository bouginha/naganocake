class Order < ApplicationRecord
    has_many :ordered_product
    belongs_to :member
    # 注文ステータス（0=入金待ち / 1=入金確認 / 2=製作中 / 3=発送準備中 /4=発送済み）
    enum order_status: {
      "入金待ち":0,
      "入金確認":1,
      "製作中":2,
      "発送待ち":3,
      "発送済み":4,
    },_prefix: true
        enum received_status: {

    },_prefix: true
end
