Rails.application.routes.draw do
  # 外卡路由
  # ex: http://localhosts:3000/events/index
  # 路由會把request丟到controller 是 events , action 是 index 中執行後由該方法產生view
  match ':controller(/:action(/:id(.:format)))', :via => :all
end
