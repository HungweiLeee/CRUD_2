class EventsController < ApplicationController
  # view對應的規則  會是app/views/<controller>/<action>.html.erb

  # events
  # events/index
  # action 是 index 對應的view會是 app/views/events/index.html.erb
  def index
    # 查詢所有的活動的資料，將查詢的結果放到一個實例變數（instance variable）
    # 查詢所有的資料：透過model進行查詢。
    # 變數命名建議是可以看得出內容的命名，例如events容易理解裡面是由很多個event組成。
    @events = Event.page(params[:page]).per(5)
  end

  # events/new
  # action 是 new 對應的view會是 app/views/events/new.html.erb
  def new
    # 透過Event model 產生一個空的Event物件，並將它存到實例變數（instance variable）中，view 中才可以使用。
    @event = Event.new
  end

  # events/create
  # 這個action是接收new表單post過來的東西後進行新增資料
  # !!!! action create並沒有對應的view 新增完成後這個action 是進行轉跳
  def create
    # 處理strong parameter
    # https://ihower.tw/rails4/basic.html 參考 新增資料 章節
    @event = Event.new(event_params)
    @event.save

    # 透過save的方法存入資料庫

    # 轉跳到show
    # action show是顯示一筆資料 因此redirect_to 除了告訴rails 要去哪個action外
    # 還需要帶入:id => @event 告訴rails是哪一筆資料
    redirect_to :action => :index

  end

  # events/show/:id
  # action 是 show 對應的view 是 app/views/events/show.html.erb
  def show
    # 藉由Event model，利用params[:id]找到該id的event
    # 指派到實例變數（instance variable），view可以使用該變數。
    @event = Event.find(params[:id])

  end

  # events/edit/:id
  # action 是 edit 對應的view 是 app/views/events/edit.html.erb
  def edit
    # 藉由Event model，利用params[:id]找到該id的event
    # 指派到實例變數（instance variable），view可以使用該變數。
    @event = Event.find(params[:id])
  end

  # events/update/:id
  # 這個action是接收edit表單post過來的東西後進行資料資料
  # !!!! action update並沒有對應的view 修改完成後這個action 是進行轉跳
  def update
    # 藉由Event model，利用params[:id]找到該id在資料表中的那一個row，
    # @event會是一個Event產出來的物件，代表資料表中的一個row。
    @event = Event.find(params[:id])

    # @event是透過Event查詢出來的物件，代表資料表的一個row。
    # 可以使用instance method，update去更新內容。
    # ex: @event.update(:name => "foo" , :description => "bar")
    # 但現在update的資料是從表單post進來
    # 因此處理strong parameter
    @event.update(event_params)

    redirect_to :action => :show, :id => @event

    # 轉跳到show
    # action show是顯示一筆資料 因此redirect_to 除了告訴rails 要去哪個action外
    # 還需要帶入:id => @event 告訴rails是哪一筆資料

  end

  # events/destroy/:id
  # !!!! action destroy並沒有對應的view 刪除完成後這個action 是進行轉跳
  def destroy
    # 藉由Event model，利用params[:id]找到該id的event
    @event = Event.find(params[:id])
    @event.destroy

    # 利用物件的方法刪除該筆資料
    redirect_to :action => :index
  end
    # 轉跳到index，redirect_to

  private 

  def event_params
    params.require(:event).permit(:name, :description)
  end
end
