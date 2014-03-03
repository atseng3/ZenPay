class User < ActiveRecord::Base
  attr_accessible :f_name, :l_name, :email, :password, :profile_photo
  attr_reader :password

  validates :password_digest, :presence => { :message => "Password can't be blank" }
  validates :password, :length => { :minimum => 6, :allow_nil => true }
  validates :session_token, :presence => true
  validates :f_name, :l_name, :email, :presence => true

  after_initialize :ensure_session_token
  
  has_attached_file :profile_photo, :styles => {
    :big => "300x300>",
    :small => "35x35#"
  }, :default_url => "/assets/missing.png"
  
  has_many :pads, 
           :primary_key => :id,
           :foreign_key => :owner_id,
           :class_name => 'Pad'
           
  has_many :bookings,
           :primary_key => :id,
           :foreign_key => :booker_id,
           :class_name => 'Booking'
  
  def profile_photo_url
    self.profile_photo.url
  end

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)

    return nil if user.nil?

    user.is_password?(password) ? user : nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
  end

  private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end
