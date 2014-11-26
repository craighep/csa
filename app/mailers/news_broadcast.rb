class NewsBroadcast < ActionMailer::Base
    def send_news(user, broadcast, email_list)
        @firstname = user.firstname
        @content = broadcast.content

        mail to: "crh13@aber.ac.uk",
        subject: "Aber CS #{email_list} News",
        from: "crh13@aber.ac.uk"
    end
end
