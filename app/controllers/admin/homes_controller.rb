class Admin::HomesController < ApplicationController
  
  # ログインしていないユーザーに対するページアクセスの制限
  # 基礎知識学習フェーズ > アプリケーションを完成させよう2 > 21章【バリデーション・権限を設定しよう】
  before_action :authenticate_admin!
  

end
