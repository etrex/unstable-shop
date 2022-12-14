# README

不穩定商店，目標是模擬一個很不穩定的電商網站

提供簡易的購物流程，不提供任何付款功能、物流功能，結帳不需要填寫任何資料

## 頁面
- 首頁
  - menu
- 登入頁
  - 註冊
  - 登入
- 商品列表頁
  - 商品列表
- 購物車頁
  - 結帳
- 訂單列表頁
- 訂單明細頁
- 後台

## 資料模型
- users
- products
  - name
  - description
  - image_url
  - price
- orders
  - user
  - state
    - cart：購物車
    - checked：已結帳
  - total_price
- order_items
  - order
  - product
  - quantity
  - price
- settings
  - key
  - value

## 不穩定功能
- 所有操作都有可能會遇到連線逾時
- 商品頁的加入購物車按鈕可能會消失
- 購物車頁的結帳按鈕可能會消失
- 登入可能會失敗
- 加入商品至購物車可能會失敗
- 加入商品至購物車成功後，購物車內可能沒有此商品
- 購物車結帳可能會失敗
- 購物車結帳成功時，可能會跳轉到其他頁面而不是訂單明細頁

## 後台功能
- 由 /admin 進入後台
- 需要先執行 rails db:seed 產生設定資料
- Settings 分頁可以設定各項不穩定功能的發生機率
- Products 分頁可以新增、編輯、刪除商品
