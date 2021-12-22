class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    #お問い合わせ一覧を上から最新順に表示
    @contacts = Contact.page(params[:page]).per(10).order(created_at: :desc)
  end
end
