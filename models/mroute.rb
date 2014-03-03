class Mroute < Nestful::Resource
  endpoint 'https://api.mailgun.net/v2/routes'
  options :auth_type => :basic, :user => 'api', :password => ENV['MAILGUN_API_KEY']

  def self.all
    self.new(get)
  end

end
