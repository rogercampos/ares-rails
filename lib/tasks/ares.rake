namespace :ares do
  desc "Updates the project cron definition in ares service"
  task upload: [:environment] do
    class Context
      include Ares::Rails::Engine.routes.url_helpers

      def default_url_options
        { host: Ares.domain }
      end
    end

    context = Context.new
    body = Ares.entries.map do |id, entry|
      url = context.cron_url(id)
      "#{entry[:schedule]} #{url}"
    end.join("\n")

    response = HTTParty.put "https://ares.rogercampos.com/api/cronfile",
                            headers: {
                              "Content-Type" => 'application/json',
                              'X-Ares-Api-Token' => Ares.api_token
                            },
                            body: { body: body }.to_json

    if response.code == 200
      puts "Ares cron updated successfully."
    else
      raise "Error in Aresfile: #{JSON.parse(response)["errors"]}"
    end
  end
end