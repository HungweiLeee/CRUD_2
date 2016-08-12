class EventsController < ApplicationController
  # view對應的規則  會是app/views/<controller>/<action>.html.erb

  # events
  # events/index
  # action 是 index 對應的view會是 app/views/events/index.html.erb
  def index
    # 查詢所有的活動的資料，將查詢的結果放到一個實例變數（instance variable）
    # 查詢所有的資料：透過model進行查詢。
    # 變數命名建議是可以看得出內容的命名，例如events容易理解裡面是由很多個event組成。

  end
end
