require 'jwt'

class Auth

  ALGORITHM = 'HS256'
  
  def self.exp
		(Time.now + 1.month).to_i
	end
  
  def self.issue(payload)
    JWT.encode(
      payload.merge({exp: self.exp}),
      auth_secret,
      ALGORITHM)
  end
  
  def self.decode(token)
    JWT.decode(token, 
      auth_secret, 
      true, 
      { algorithm: ALGORITHM }).first
  end
  
  def self.auth_secret
    Rails.application.secret_key_base
  end
end
