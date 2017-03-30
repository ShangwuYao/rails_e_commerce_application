class ContactMailer < ActionMailer::Base
    default to: 'awp135@126.com'
    
    def contact_email(name, email, body)
        @name = name
        @email = email
        @body = body
        
        require 'sendgrid-ruby'
        include SendGrid
        
        from = @email
        to = Email.new(email: 'awp135@126.com')
        subject = 'Sending with SendGrid is Fun'
        content = Content.new(type: 'text/plain', value: 'and easy to do anywhere, even with Ruby')
        mail = Mail.new(from, subject, to, content)
        
        sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
        response = sg.client.mail._('send').post(request_body: mail.to_json)
        puts response.status_code
        puts response.body
        puts response.headers
        
        #mail(from: email, subject: 'Contact From Message')
    end
end