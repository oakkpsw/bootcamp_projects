print("Welcome to Rock Paper Scissor Game")
print("Please input Your name ")
user_name <- readLines("stdin",n=1)
print(paste("Welcome! ", user_name))
play_game <- TRUE
win_count <- 0
lose_count <- 0
draw_count <- 0
while(play_game){
  print("Take your pick 1.Paper 2.Rock 3.Scissor press other to exit")
  user_pick <- as.character(readLines("stdin",n=1))
  bot_pick <- as.character(sample(1:3, 1))
  if (user_pick == "1"){
    user_pick_word <-"Paper"
  } else if (user_pick == "2"){
    user_pick_word <-"Rock"
  } else if (user_pick == "3"){
    user_pick_word <-"Scissor"
  }
  if (bot_pick == "1"){
    bot_pick_word <-"Paper"
  } else if (bot_pick == "2"){
    bot_pick_word <-"Rock"
  } else if (bot_pick == "3"){
    bot_pick_word <-"Scissor"
  }
  
  #draw
  if(user_pick == "1" & bot_pick == "1" | user_pick == "2" & bot_pick == "2"  | user_pick == "3" & bot_pick == "3" ) {
    print("Draw")
    draw_count <- draw_count + 1
  }  # user win
  else if (user_pick == "1" & bot_pick == "2" | user_pick == "2" & bot_pick == "3"  | user_pick == "3" & bot_pick == "1" ){
    print("You Win!")
    win_count <- win_count + 1
  } # user lose 
  else if (user_pick == "1" & bot_pick == "3" | user_pick == "2" & bot_pick == "1"  | user_pick == "3" & bot_pick == "2" ){
    print("You Lose!")
    lose_count <- lose_count + 1
  }  #exit
  else {
    play_game <- FALSE
        
  }
  if (play_game){
    print(paste("You Choose ", user_pick_word))
    print(paste("Bot Choose ", bot_pick_word))
  }
}
print("Summary! ")
print(paste("WIN ", win_count))
print(paste("LOSE ", lose_count))
print(paste("DRAW ", draw_count))
print("Thank You For Playing!")