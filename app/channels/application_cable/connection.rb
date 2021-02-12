module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      puts "\n\n===>> CONECTANDO\n\n"
      self.current_user = find_verified_user
    end

    private

    def find_verified_user
      puts "\n\nFIND VERIFIED USER\n\n"
      if verified_user = User.find_by(id: cookies.signed['user.id'])
        verified_user
      else
        reject_unauthorized_connection
      end
    end
  end
end
