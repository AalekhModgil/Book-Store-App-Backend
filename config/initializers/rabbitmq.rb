require "bunny"

module RabbitMQ
  def self.create_channel
    @connection ||= Bunny.new(
      host: ENV["RABBITMQ_HOST"] || "localhost",
      port: ENV["RABBITMQ_PORT"] || 5672,
      username: ENV["RABBITMQ_USERNAME"] || "guest",
      password: ENV["RABBITMQ_PASSWORD"] || "guest"
    ).tap(&:start)
    @connection.create_channel
  end

  at_exit { @connection&.close }
end
