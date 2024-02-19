include SendGrid

class NotifyMunicipeService
  def initialize(municipe)
    @municipe = municipe
  end

  def send_notifications(action)
    message = I18n.t('notifications.new_municipe', name: @municipe.name) if action == 'create'
    message = I18n.t('notifications.update_municipe', name: @municipe.name) if action == 'update'

    send_sms(message)
    send_email(message)
  end

  private

  def send_sms(message)
    client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])

    client.messages.create(
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: @municipe.phone_number,
      body: message
    )
  end

  def send_email(message)
    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])

    email = SendGrid::Mail.new do |m|
      m.from = SendGrid::Email.new(email: ENV['SENDER_EMAIL'])
      m.subject = I18n.t('notifications.subject')
      m.to = SendGrid::Email.new(email: @municipe.email)
      m.content =  Content.new(type: 'text/plain', value: message)
    end

    response = sg.client.mail._('send').post(request_body: mail.to_json)
  end
end
