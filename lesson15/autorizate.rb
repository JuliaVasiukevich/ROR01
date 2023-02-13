require_relative 'user'
require_relative 'personal_account'
class Autorizate

  attr_reader :autorizate, :current_user
  def initialize
    @autorizate = false
    @current_user = nil
  end
  def sign_in
    user_from_DB = nil

    puts 'Please enter your login:'
    username = gets.chomp

    File.open("users.txt") do |file|
      file.each_line do |line|
        id, name, password = line.strip.split(",")
        user_from_DB = {id: id, name: name, password: password} if name == username
      end
    end

    raise 'User doesn`t exist' if user_from_DB.nil?

    puts 'Please enter your password:'
    password = gets.chomp

    raise 'Password is wrong.' if user_from_DB[:password] != password
    @current_user = PersonalAccount.new(user_from_DB[:id], user_from_DB[:name], user_from_DB[:password])
    @autorizate = true
    puts 'Login successful!'

  rescue => e
    puts "Error: #{e}."
    retry
  end

  def sign_up
    puts 'Please enter your login:'
    username = gets.chomp

    File.open("users.txt") do |file|
      file.each_line do |line|
        id, name, password = line.strip.split(",")
        raise 'User exist' if name == username
      end
    end

    password = self.create_password

    id = File.foreach("users.txt").inject(0) { |c, _| c + 1 } + 1
    File.open("users.txt", "a") do |file|
      file.puts "#{id},#{username},#{password}"
    end
    @current_user = PersonalAccount.new(id, username, password)
    @autorizate = true
    puts 'Login successful!'

  rescue => e
    puts "Error: #{e}."
    retry
  end

  def create_password
    puts 'Please enter your password:'
    password1 = gets.strip

    puts 'Please repeat your password:'
    password2 = gets.strip

    raise 'Passwords are not the same' unless password1 == password2

    password2

  rescue => e
    puts "Error: #{e}."
    retry
  end

end
