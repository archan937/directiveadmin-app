config = ActiveRecord::Base.connection.instance_variable_get(:@config)
host, port, username, password, database = config.stringify_keys.values_at *%w(host port username password database)
file = File.expand_path("../seeds.sql", __FILE__)

puts "Importing #{file.gsub("#{Rails.root}/", "")} ..."

`#{
  [
    "mysql",
   ("-h #{host}" unless host.blank?), ("-P #{port}" unless port.blank?),
    "-u #{username || "root"}", ("-p#{password}" unless password.blank?),
    "#{database} < #{file}"
  ].compact.join(" ")
}`

puts "Done."
