class RerouteController < ApplicationController
  def okta_authorize
    @url = params["url"]

    final_url = if @url.blank?
                  @url
                else
                  prepare_callback
                end

    redirect_to final_url, allow_other_host: true
  end

  def prepare_callback
    callback = Addressable::URI.parse(@url)
    callback.query_values = (callback.query_values || {}).merge(request.query_parameters.except(:url))
    callback.to_s
  end
end
