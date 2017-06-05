# require_relative "./config/environment.rb"
# run Application.new

class Montana

  def call(env)
    [500, {"Content-Type" => "text/plain"}, ["Say hello to my little friend!"]]
  end

end

run Montana.new
