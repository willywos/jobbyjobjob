

module JobbyJobJob
  class Response
    attr_accessor :data,
		              :code,
                  :headers

    def initialize(response={})
      @data = response[:body]
      @code = response[:code]
      @headers = response[:headers]
    end

    def headers
      @headers
    end

    def data
      (@data.nil? || @data.empty?) ? {} : @data
    end

    def is_valid?
      @code == "200"
    end
  end
end
