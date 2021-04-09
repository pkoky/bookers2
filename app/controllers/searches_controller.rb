class SearchesController < ApplicationController

  def search
    @range = params[:range] #range = 範囲

    if @range == "User"
      @users = User.looks(params[:search], params[:word])#:search, :word はviewから値をとってきている。
    else
      @books = Book.looks(params[:search], params[:word])
    end
  end
  #下記コードにて検索フォームからの情報を受け取っています。
  #検索モデル→params[:range]
  #検索方法→params[:search]
  #検索ワード→params[:word]

  #if文を使い、検索モデルUserorBookで条件分岐させます。

  #looksメソッドを使い、検索内容を取得し、変数に代入します。
  #検索方法params[:search]と、検索ワードparams[:word]を参照してデータを検索し、
   # 1：インスタンス変数@usersにUserモデル内での検索結果を代入します。
  #2：インスタンス変数@booksにBookモデル内での検索結果を代入します。

end
