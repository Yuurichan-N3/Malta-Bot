require 'httparty'
require 'faker'
require 'json'
require 'securerandom'
require 'colorize'
require 'eth'

def generate_email_from_name(first_name, last_name)
  # Create Gmail address from first and last name
  "#{first_name.downcase}.#{last_name.downcase}@gmail.com"
end

def generate_password(surname)
  # Generate password: surname + random number (at least 5 digits) + .
  random_digits = (0...(rand(5..8))).map { rand(10) }.join
  "#{surname}#{random_digits}."
end

def generate_polygon_address
  # Generate new Ethereum/Polygon account
  key = Eth::Key.new
  [key.address, key.private_hex]
end

def save_to_json(data_list)
  # Save successful registrations to information.json
  existing_data = File.exist?('information.json') ? JSON.parse(File.read('information.json')) : []
  existing_data.concat(data_list)

  File.write('information.json', JSON.pretty_generate(existing_data))
  puts "Data saved to information.json".green
end

def register_account(num_attempts)
  successful_registrations = []

  num_attempts.times do |i|
    puts "Attempt #{i + 1}/#{num_attempts}".cyan

    # Generate name and surname
    name = Faker::Name.first_name
    surname = Faker::Name.last_name

    # Create user data
    user_data = {
      'name' => name,
      'surname' => surname,
      'email' => generate_email_from_name(name, surname),
      'password' => generate_password(surname),
      'country' => 'indonesia'
    }

    # Generate Polygon address and private key
    address, private_key = generate_polygon_address
    user_data['polygon_address'] = address

    # payload
    payload = {
      'name' => user_data['name'],
      'surname' => user_data['surname'],
      'email' => user_data['email'],
      'password' => user_data['password'],
      'country' => user_data['country'],
      'polygon_address' => user_data['polygon_address']
    }

    # API endpoint
    url = "https://www.ulys.site/api/users"

    begin
      # Make POST request
      response = HTTParty.post(url, body: payload.to_json, headers: { 'Content-Type' => 'application/json' })

      if response.success?
        # Store successful registration data
        success_data = {
          'name' => user_data['name'],
          'surname' => user_data['surname'],
          'email' => user_data['email'],
          'password' => user_data['password'],
          'country' => user_data['country'],
          'polygon_address' => user_data['polygon_address'],
          'private_key' => private_key
        }
        successful_registrations << success_data

        # Display log with specific fields and colors
        puts "Registration successful:".green
        puts "Name: #{user_data['name']}".yellow
        puts "Surname: #{user_data['surname']}".yellow
        puts "Email: #{user_data['email']}".yellow
        puts "Address: #{user_data['polygon_address']}".yellow
        puts "Country: #{user_data['country']}".yellow
      else
        puts "Registration failed: #{response.message}".red
      end
    rescue StandardError => e
      puts "Registration failed: #{e.message}".red
    end

    # Add delay between attempts
    if i < num_attempts - 1
      puts "Waiting 1 second before next attempt...".yellow
      sleep(1)
    end
  end

  # Save successful registrations
  if successful_registrations.any?
    save_to_json(successful_registrations)
    puts "Saved #{successful_registrations.length} successful registrations".green
  else
    puts "No successful registrations to save".red
  end
end

if __FILE__ == $PROGRAM_NAME
  # Display banner
  puts <<~BANNER.blue
    ╔══════════════════════════════════════════════╗
    ║      🌟 MALTA BOT - Automated Signups        ║
    ║   Automate your account registrations!       ║
    ║  Developed by: https://t.me/sentineldiscus   ║
    ╚══════════════════════════════════════════════╝
  BANNER

  begin
    print "Enter number of registration attempts: ".yellow
    attempts = gets.chomp.to_i
    if attempts <= 0
      puts "Please enter a positive number".red
    else
      register_account(attempts)
    end
  rescue ArgumentError
    puts "Invalid input. Please enter a number".red
  end
end
