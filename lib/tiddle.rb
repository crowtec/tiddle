require "tiddle/version"
require "tiddle/model"
require "tiddle/strategy"
require "tiddle/rails"
require "tiddle/token_issuer"

module Tiddle
  def self.create_and_return_token(resource, request, options = {})
    TokenIssuer.build.create_and_return_token(resource, request, options)
  end

  def self.renew_token(resource, request, options = {})
    TokenIssuer.build.renew_token(resource, request, options)
  end

  def self.expire_token(resource, request)
    TokenIssuer.build.expire_token(resource, request)
  end

  def self.purge_old_tokens(resource)
    TokenIssuer.build.purge_old_tokens(resource)
  end

  def self.list_tokens(resource)
    TokenIssuer.build.list_tokens(resource)
  end

  def self.last_used_token(resource)
    TokenIssuer.build.last_used_token(resource)
  end

  def self.last_used_at(resource)
    TokenIssuer.build.last_used_at(resource)
  end
end

Devise.add_module :token_authenticatable,
                  model: 'tiddle/model',
                  strategy: true,
                  no_input: true
