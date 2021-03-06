class Home < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :nickname,  :captcha  => true
  attribute :start_date
  attribute :end_date

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Contact Form Inquiry",
      :to => "elizabethzookeeper@gmail.com",
      :from => "elizabethzookeeper@gmail.com",
      :contact => %("#{name}" <#{email}>),
      :date => %("#{start_date} to #{end_date}")
    }
  end
end
