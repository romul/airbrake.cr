require "log"

module Airbrake
  class LoggerBackend < ::Log::Backend
    def write(entry : Log::Entry)
      puts "#{entry.severity}: #{entry.message}"
      exception = entry.exception || Exception.new(entry.message)
      params = {
        source:   entry.source,
        severity: entry.severity,
        message:  entry.message,
        metadata: entry.context.inspect,
      }
      Airbrake.notify(exception, params)
    end
  end
end
