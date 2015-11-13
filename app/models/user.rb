class User < ActiveRecord::Base

  has_secure_password

  # this wont delete the dependent data from the database, only make the reference null
  has_many :questions, dependent: :nullify, dependent: :destroy
  has_many :answers, dependent: :nullify
  has_many :likes, dependent: :destroy
  has_many :liked_questions, through: :likes, source: :question
  has_many :favourites, dependent: :destroy
  has_many :favourited_questions, through: :favourites, source: :question
  has_many :votes, dependent: :nullify
  has_many :voted_question, through: :votes, source: :votes

  validates :email, presence: true, uniqueness: true

  def full_name
    "#{first_name} #{last_name}".strip
  end

end
