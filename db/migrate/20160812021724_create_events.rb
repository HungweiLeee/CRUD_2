# 在events的table中新增四個欄位 
# column type 可以參考 https://ihower.tw/rails4/migrations.html 資料庫的欄位定義 章節
class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      # column name => name ， column type => string 
      t.string :name
       # column name => description ， column type => text  

      # column name => is_public ， column type => boolean  

      # column name => capacity ， column type => integer

      t.timestamps
    end
  end
end
# 檔案修改完成後存檔
 # 到console中執行migrate
 # 指令：rails db:migrate
# 提示：rails 會自動幫我們建立一個id欄位，這個欄位是自動增加且唯一的！
#      timestamps 會在資料庫新增created_at updated_at這兩個欄位，儲存建立時間與更新時間。