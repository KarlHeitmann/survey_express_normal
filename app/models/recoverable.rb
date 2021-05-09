sign_in_after_reset_password

def set_reset_password_token
  raw, enc = Devise.token_generator.generate(self.class, :reset_password_token)

  self.reset_password_token   = enc
  self.reset_password_sent_at = Time.now.utc
  save(validate: false)
  raw
end