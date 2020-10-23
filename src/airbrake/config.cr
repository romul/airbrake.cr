module Airbrake
  class Config
    property project_id : String | Nil
    property project_key : String | Nil
    property domain : String = "airbrake.io"
    property user_agent : String = "Airbrake Crystal"
    property development_environments : Array(String) = ["development", "test"]
    getter project_id
    getter project_key
    getter domain
    getter user_agent
    getter development_environments

    INSTANCE = Config.new

    def initialize
    end

    def path
      "/api/v3/projects/#{project_id}/notices?key=#{project_key}"
    end
  end
end
