class CommentsController < ApplicationController

  def create
    @prototype = Prototype.find(params[:prototype_id]) #今回はなくておｋ投稿完了後のビュー作成するならそこで@prototypeを使う
    @comment = @prototype.comments.new(comment_params)
    if @comment.save 
      redirect_to prototype_path(@prototype) #どのプロトタイプのshowに行けばいいか分かるように引数でIDを渡す
    else 
      @prototype = @comment.prototype #アソシエーションで情報を取ってくるときはこんな書き方
      @comments = @prototype.comments #アソシエーションで情報を取ってくるときはこんな書き方
      redirect_to prototype_path(@prototype)
      #render "prototypes/show" #もしリダイレクトでshowに行くなら、一から読み込むから上二つの定義はいらない。
                               #今回はrenderなので、このcreateのなかで完結させるために、改めて定義している。
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id)
  end
end
