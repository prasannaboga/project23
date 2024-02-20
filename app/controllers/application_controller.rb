class ApplicationController < ActionController::Base
  before_action :set_sentry

  def set_sentry
    Sentry.set_user(id: 11, organization_id: 98)
    Sentry.set_extras(params: params.to_unsafe_h, url: request.original_url)
  end
end
