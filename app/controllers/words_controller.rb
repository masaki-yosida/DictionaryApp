class WordsController < ApplicationController
  before_action :set_word, only: [:show]

  def index
    @words = if params[:search]
               Word.where('term LIKE ?', "%#{params[:search]}%")
             else
               Word.all
             end
  end

  def search
    @words = if params[:search]
               Word.where('term LIKE ?', "%#{params[:search]}%")
             else
               Word.all
             end

    render :index
  end

  def show
  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.new(word_params)

    if @word.save
      redirect_to @word, notice: '単語が追加されました。'
    else
      render :new
    end
  end

  def edit
    @word = Word.find(params[:id])
  end

  def update
    @word = Word.find(params[:id])

    if @word.update(word_params)
      redirect_to @word, notice: '単語が更新されました。'
    else
      render :edit
    end
  end

  def show
    @word = Word.find(params[:id])
    @comments = @word.comments
    @comment = Comment.new
  end


  def create_comment
    @word = Word.find(params[:id])
    @comment = @word.comments.new(comment_params)

    if @comment.save
      redirect_to word_path(@word), notice: 'コメントが追加されました。'
    else
      @comments = @word.comments
      render :show
    end
  end
  

  private

  def set_word
    @word = Word.find(params[:id])
  end

  def word_params
    params.require(:word).permit(:term, :definition)
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end



