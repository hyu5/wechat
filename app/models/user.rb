class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  has_and_belongs_to_many :groups
  has_and_belongs_to_many :messages

  has_many :moments

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :FirstName, :LastName, length: {maximum:50}
  validates :Phone, allow_blank: true, format: {
                      with:    /[0-9]{3}-[0-9]{3}-[0-9]{4}/,
                      message: 'Phone number must be in xxx-xxx-xxxx format.'
                  }
  validates :DateOfBirth, allow_blank: true, format: {
                            with:    /\d{4}\-\d{2}\-\d{2}/,
                            message: 'Date of birth must be in the yyyy-mm-dd format.'
                        }
  validates :email, format: {
                      with:    /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/,
                      message: 'Please input the valid email address.'
                  }
end
