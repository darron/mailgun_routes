MailgunRoutes::Admin.controllers :mroute do

  get :index  do
    routes = Mroute.all
    mroutes = routes.items
    @mroutes = Hash.new
    mroutes.each do |mroute|
      match_this = mroute['expression'].to_s.scan(/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i)
      match_action = mroute['actions'].to_s.scan(/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i)
      @mroutes[mroute['id']] = { 'id' => mroute['id'] ,'src' => match_this.to_s.gsub!(/\[|\]|\"/, ''), 'dest' => match_action.to_s.gsub!(/\[|\]|\"/, '') }
    end
    render 'mroute/index'
  end

end
