class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # ::registerable, token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
end
