require 'sinatra'
require 'sinatra/reloader'

def caesar_cipher (text, numberChange)
    letters = text.chars;
    @@caesar_code = '';
    letters.each { |x|
    ascii = x.ord
    new_letter = x;
    if (ascii >= 65 && ascii <= 90)
        new_letter = (((((ascii - 65 + numberChange) % 26)+26)%26)+65).chr;
    elsif (ascii >= 97 && ascii <= 122)
        new_letter = (((((ascii - 97 + numberChange) % 26)+26)%26)+97).chr;
    end
    @@caesar_code = @@caesar_code + new_letter;
    }
    puts ('TEXT ' + @@caesar_code);
    return @@caesar_code;
end


get '/' do

    user_text_input = params['text'];
    user_shift_input = params['shiftValue'].to_i;
    if !params['text'].empty? && !params['shiftValue'].empty? && params['shiftValue'].to_i.to_s == params['shiftValue']
    output = caesar_cipher(user_text_input,user_shift_input);
    else
        output = 'Make sure you input proper values!';
    end

    erb :index, :locals => {:test => output }
  end