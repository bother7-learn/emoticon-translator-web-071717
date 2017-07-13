# require modules here
require 'yaml'
require 'pry'
##thing = YAML.load_file('some.yml')

def load_library(file_path)
  # code goes here
##  binding.pry
new_hash = Hash.new(0)
  library = YAML.load_file(file_path)
  library.each do |meaning, stream|
    if new_hash.has_key?("get_meaning")
      new_hash["get_meaning"] = new_hash["get_meaning"].merge(stream[1] => meaning)
      new_hash["get_emoticon"] = new_hash["get_emoticon"].merge(stream[0] => stream[1])
    ##  binding.pry
    else
      new_hash = new_hash.merge("get_meaning" => {stream[1] => meaning}, "get_emoticon" => {stream[0] => stream[1]})

    end
end
new_hash
end

def get_japanese_emoticon(file_path, emoji)
  check = 0
  reply = ""
  new_hash = load_library(file_path)
  new_hash["get_emoticon"].each do |english, japanese|
    if english == emoji
      reply = japanese
      check = 1
      ##binding.pry
    end
  end
  if check == 0
    reply = "Sorry, that emoticon was not found"
  else
    reply
  end
  # code goes here
end

def get_english_meaning(file_path, emoji)
  check = 0
  reply = ""
  new_hash = load_library(file_path)
  new_hash["get_meaning"].each do |emote, meaning|
  ##  binding.pry
  if emote == emoji
    reply = meaning
    check = 1
  end
  end
  if check == 0
    reply = "Sorry, that emoticon was not found"
  else
  reply
end
  # code goes here
end
