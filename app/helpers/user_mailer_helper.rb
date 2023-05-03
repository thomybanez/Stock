module UserMailerHelper
    def verification_url(verification_token)
        verify_email_url(verification_token: verification_token)
      end
  end