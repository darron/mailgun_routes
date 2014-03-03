MailgunRoutes::Admin.controllers :mroute do

  get :index  do
    routes = Mroute.all
    @mroutes = routes.items
    render 'mroute/index'
  end

end
