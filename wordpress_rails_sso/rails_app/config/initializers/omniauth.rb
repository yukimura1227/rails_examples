OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :wordpress_hosted,
    '11169f21e282c809a2395b25126cdd7df3b1005e', # Key
    '9e91bb9cbb9484c9f32e', # Secret
    strategy_class: OmniAuth::Strategies::WordpressHosted,
    client_options: { site: 'http://vccw.test' }
end
