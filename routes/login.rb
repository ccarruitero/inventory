require 'rest-client'
require 'json'

class Login < Cuba
  define do
    on default, param(:assertion) do |assertion|
      server = 'https://verifier.login.persona.org/verify'
      req = RestClient::Resource
      assertion_params = {
        assertion: assertion,
        audience: "http://localhost:9292"
      }
      res = JSON.parse(req.new(server, :verify_ssl=> true).post(assertion_params))

      if res['status'] == 'okay'
        session[:email] = res['email']
        res.to_json
      else
        {status: 'error'}.to_json
      end
    end
  end
end
