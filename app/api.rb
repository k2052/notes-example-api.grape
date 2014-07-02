module Notes
  class API < Grape::API
    version 'v1', using: :header, vendor: 'tribute', strict: false
    format :json

    helpers Notes::Helpers::Auth
    helpers Notes::Helpers::Resp

    mount Notes::Api::Auth
    mount Notes::Api::Notes
  end
end
