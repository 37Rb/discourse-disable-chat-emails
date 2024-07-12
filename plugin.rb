# name: Disable Chat Emails
# about: Disable chat emails for all users in Discourse by bulk changing user preferences.
# version: 0.0.1
# authors: Ryan Boder
# url: https://github.com/37Rb/discourse-disable-chat-emails

after_initialize do

    class ::Jobs::DisableChatEmails < Jobs::Scheduled
      every 30.minutes
  
      def execute(args)
        ActiveRecord::Base.connection.execute("UPDATE user_options SET chat_email_frequency = 0")
      end
    end
  
end
