# acces via methods 
class credentials

    def self.google_app_id
     Rails.application.credentials[:GOOGLE_APP_ID]
    end

    def self.google_app_secet 
        Rails.application.credentials[:GOOGLE_APP_SECRET] 
    end

    def self.github_app_id
        Rails.application.credentials[:GITHUB_APP_ID]
    end

    def self.github_app_secret
        Rails.application.credentials[:GITHUB_APP_SECRET] 
    end

end 