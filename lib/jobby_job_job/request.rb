require "net/http"

module JobbyJobJob
  class Request
    def request_get(url, params=nil)
      req = Net::HTTP::Get.new(request_uri(url).request_uri)
      req['Connection'] = 'Keep-Alive'
      request(req, url, params)
    end

    def request_uri(url)
      URI(URI.encode(url))
    end

    def request(req, url, params)
      req.content_type = 'charset=utf-8'
      req.body = params unless params.nil?
      res = http_request(url, req)
      log_request(res, url, params)
      JobbyJobJob::Response.new({ code: res.code, body: res.body, headers: res})
    end

    def http_request(url, req)
      uri = request_uri(url)
      http = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https')
      http.request req
    end

    def log_request(res, url, params)
      Rails.logger.debug("URL:#{url}")
      Rails.logger.debug("PARAMS:#{params}")
      Rails.logger.debug("CODE:#{res.code.inspect}")
      # Rails.logger.debug("RESPONSE:#{res.body.inspect}")
    end
  end
end
