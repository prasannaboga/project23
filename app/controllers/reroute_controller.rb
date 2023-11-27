class RerouteController < ApplicationController
  def okta_authorize
    @url = params["url"]

    # here need to authentication process and okta session
    # can be create cross domain cookie

    final_url = prepare_callback
    redirect_to final_url, allow_other_host: true
  end

  def prepare_callback
    callback = Addressable::URI.parse(@url)
    callback.query_values = (callback.query_values || {}).merge(request.query_parameters.except(:url))
    callback.to_s
  end
end
