class RedirectToIdpController < ApplicationController
  def index
    saml_message = SESSION_PROXY.idp_authn_request(cookies)
    @request = IdentityProviderRequest.new(
      saml_message,
      selected_identity_provider.simple_id,
      selected_answer_store.selected_answers
    )
  end
end
