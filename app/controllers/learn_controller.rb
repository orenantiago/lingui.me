class LearnController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.where(:learning_language => Language.find(LearningLanguage.where(:user => current_user.id).pluck(:language_id)).pluck(:idiom),
                        :mother_language   => Language.find(MotherLanguage.where(:user => current_user.id).pluck(:language_id)).pluck(:idiom)
                        ).includes(:user).order("created_at DESC")
  end
end
