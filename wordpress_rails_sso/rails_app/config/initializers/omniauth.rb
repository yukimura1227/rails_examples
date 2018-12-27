OmniAuth.config.logger = Rails.logger

# 以下、raw_infoのアクセス先が誤っているようだったのでモンキーパッチ
module OmniAuth
  module Strategies
    class WordpressHosted < OmniAuth::Strategies::OAuth2
      def raw_info
        puts access_token.token
        @raw_info ||= access_token.get(
          "/oauth/request_access",
          :params => { 'Authorization' =>
                       "Bearer #{access_token.token}"
                       }
        ).parsed
      end
    end
  end
end
