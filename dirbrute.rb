require 'net/http'
require 'net/https'
require 'net/dns'
require 'time'


#Add color

class String
def red;            "\e[31m#{self}\e[0m" end
def green;          "\e[32m#{self}\e[0m" end
def blue;           "\e[34m#{self}\e[0m" end
def bold;           "\e[1m#{self}\e[22m" end
def underline;      "\e[4m#{self}\e[24m" end
end

puts "==================== Directory Brute Force =============".bold.blue
puts "\n"
puts "===================== By Dims ===========================".bold.blue
puts "\n"


puts "Enter your Target Domain(ex: 'google.com'): "
host=gets.chomp.to_s

puts"Enter Target Protocol(ex: 'http' or 'https'): "
protcl=gets.chomp.to_s

puts "Enter Wordlist file(ex: php.txt or list.txt): "
file=gets.chomp.to_s
puts ""
puts "[+] Using #{file} as a wordlist on #{host} used protocol is #{protcl}".green
puts "[+] Starting Attack....".green
puts ""
sleep(5)
File.readlines(file).each do |line|
  uri = URI(protcl+'://'+host+'/'+line.chomp)
  res = Net::HTTP.get_response(uri)
  puts "[#{res.code}]: #{line}"

end
