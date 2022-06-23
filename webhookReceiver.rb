require 'sinatra'

    post '/' do
      request.body.rewind
      payload_body = request.body.read
      verify_signature(payload_body)
      system( "./FrontendDownload.sh" )
      "Sucess!"
    end
    
    def verify_signature(payload_body)
      signature = 'sha256=' + OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), ENV['SECRET_TOKEN'].to_s, payload_body.to_s)
      return halt 403, "Signatures didn't match!" unless Rack::Utils.secure_compare(signature, request.env['HTTP_X_HUB_SIGNATURE_256'])
    end

