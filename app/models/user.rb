class User < ActionAuth::User

  def admin?
    id == 1
  end

end