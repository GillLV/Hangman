
class HangmanStrings

  attr_reader :incorrect_strings

def  initialize
@none_left =
"   |   \n"\
"   o   \n"\
"  /|\\  \n"\
"   |   \n"\
"  / \\  "

@one_left =
"   |   \n"\
"   o   \n"\
"  /|\\  \n"\
"   |   \n"\
"  /     "

@two_left =
"   |   \n"\
"   o   \n"\
"  /|\\  \n"\
"   |   \n"\
"        "

@three_left =
"   |   \n"\
"   o   \n"\
"  /|\\  \n"\
"       \n"\
"        "

@four_left =
"   |   \n"\
"   o   \n"\
"  /|   \n"\
"       \n"\
"        "

@five_left =
"   |   \n"\
"   o   \n"\
"   |   \n"\
"       \n"\
"        "

@six_left =
"   |   \n"\
"   o   \n"\
"       \n"\
"       \n"\
"        "

@seven_left =
"   |   \n"\
"       \n"\
"       \n"\
"       \n"\
"        "

@incorrect_strings = {7 => @seven_left, 6 => @six_left, 
                    5 => @five_left, 4 => @four_left, 
                    3 => @three_left, 2 => @two_left, 
                    1 => @one_left, 0 => @none_left}


end

end