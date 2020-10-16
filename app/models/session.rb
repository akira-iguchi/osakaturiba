class Session
  include ActiveModel::Model 
  
  attr_accessor :email, :password 
  
  validates :email, presence: true 
  validates :password, presence: true
  validate  :true_email
  validate  :true_password
  
  def true_email
      errors.add(:email, "は使われていません。") unless User.find_by(email: email)
  end 
  
  def true_password
      @user = User.find_by(email: email)
      if @user 
          errors.add(:password, "は正しくありません。") unless @user.authenticate(password)
      end 
  end 
  
  def save
   return false unless invalid?
   true
  end
end