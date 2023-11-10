class WordsController < ApplicationController
  before_action :set_word, only: [:show]

  def index
    @words = Word.all
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

  private

  def set_word
    @word = Word.find(params[:id])
  end

  def word_params
    params.require(:word).permit(:term, :definition)
  end
end
