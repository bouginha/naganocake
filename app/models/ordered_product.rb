class OrderedProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product


    # 製作ステータス（0=着手不可 / 1=製作待ち / 2=製作中 / 3=製作完了）
      enum production_status: {
      "着手不可":0,
      "製作待ち":1,
      "製作中":2,
      "製作完了":3,
    },_prefix: true
    

      end
