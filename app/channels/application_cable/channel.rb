module ApplicationCable
  class Channel < ActionCable::Channel::Base
    # # identified_by :current_user

    # def connect
    #   puts "\n\nCONECTANDO\n\n"
    #   self.current_user = find_user
    # end

    # private

    # def find_user
    #   puts "WENA WENA"
    #   User.find_by(id: cookies.signed[:current_user_id]) || reject_unauthorized_connection
    # end
  end
end
