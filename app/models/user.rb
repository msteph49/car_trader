class User < ActiveRecord::Base
    has_many :vehicles, dependent: :destroy 

    has_secure_password

    validates :user_name, :name, :email, presence: true 
    validates :user_name, :email, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    

    def to_s
        "@#{user_name}"
    end

end