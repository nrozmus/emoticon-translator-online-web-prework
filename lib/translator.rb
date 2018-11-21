# require modules here

require 'yaml'

def load_library(file_path)
  emo_result = {"get_meaning" =>{}, "get_emoticon" => {}}

  emoz_yaml = YAML.load_file(file_path)

  emoz_yaml.each do |meaning, emoti_array|
    emo_result["get_meaning"][emoti_array[1]] = meaning #japemoti to meaning
    emo_result["get_emoticon"][emoti_array[0]] = emoti_array[1] #eng emoti to jap emoti
  end

  return emo_result
end

def get_japanese_emoticon(file_path, eng_emote)
  # emoz = YAML.load_file(file_path)
  emo_result = load_library(file_path)
  return emo_result["get_emoticon"][eng_emote] unless emo_result["get_emoticon"][eng_emote].nil?
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, jap_emote)
  emo_result = load_library(file_path) 
  return emo_result["get_meaning"][jap_emote] unless emo_result["get_meaning"][jap_emote].nil?
  return "Sorry, that emoticon was not found"
end