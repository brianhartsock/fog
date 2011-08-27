module Fog
  module DNS
    class Rackspace
      class Real
        def delete_domain(domain_id, options={})

          path = "domains/#{domain_id}"
          query_data = {}

          if options.has_key? :delete_subdomains
            query_data['deleteSubdomains'] = options[:delete_subdomains].to_s
          end

          if !query_data.empty?
            path = path + '?' + array_to_query_string(query_data)
          end

          puts path
          resp = request(
            :expects  => [202, 204],
            :method   => 'DELETE',
            :path     => path
          )
          puts resp.inspect
          resp
        end
      end
    end
  end
end