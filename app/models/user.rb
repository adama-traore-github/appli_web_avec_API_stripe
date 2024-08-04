class User < ApplicationRecord
  # Ajoutez les modules Devise requis
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

  # Associations
  has_many :events, foreign_key: 'user_id', class_name: 'Event'
  has_many :attendances
  has_many :attended_events, through: :attendances, source: :event

  # Validations
  validates :email, presence: true, uniqueness: true

  # Callbacks
  after_create :send_welcome_email

  private

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  end
end
