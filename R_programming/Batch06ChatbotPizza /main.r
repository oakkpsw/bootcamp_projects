# home work 01
# chatbot rule base 
# ordering pizza 8-10 dialog

print("Welcome to our app!")
print("Hello There!")
#question 1
print("What's your name?: ")
user_name <- readLines("stdin",n=1)
# stdin = standard input n = 1 รับแค่  1 แถว
print(paste("hi", user_name))
#Q2
print("What Pizza you want to order today?")
print("1.Hawaiian 2.Pepperoni 3.Green Curry")
pizza_type <- as.integer(readLines("stdin",n=1))
if (pizza_type == 1){
  pizza_order <- "Hawaiian"
} else if (pizza_type == 2){
  pizza_order <- "Pepperoni"
} else if (pizza_type == 3){
  pizza_order <- "Green Curry"
}
#Q3
print("What Size of Pizzza?")
print("1.9inche 2.12inche 3.18inch ")
pizza_size <- as.integer(readLines("stdin",n=1))
if (pizza_size == 1){
  size_order <- "9"
} else if (pizza_size == 2){
  size_order <- "12"
} else if (pizza_size == 3){
  size_order <- "18"
}
#q4
print("What Appetizer you want to order?")
print("1.Pasta 2.Salad 3.Chicken Wings")
appertizer_type <- as.integer(readLines("stdin",n=1))
if (appertizer_type == 1){
  appertizer_order <- "Pasta"
} else if (appertizer_type == 2){
  appertizer_order <- "Salad"
} else if (appertizer_type == 3){
  appertizer_order <- "Chicken Wings"
}
#Q5
print("What Drinks you want to order?")
print("1.Water 2.Coke 3.Beer")
drink_type <- as.integer(readLines("stdin",n=1))
if (drink_type == 1){
  drink_order <- "Water"
} else if (drink_type == 2){
  drink_order <- "Coke"
} else if (drink_type == 3){
  drink_order <- "Beer"
}
#q6
print("Choose Your Payment Type")
print("1.Credit Card 2.Bank Transfer 3.Cash")
payment_type <- as.integer(readLines("stdin",n=1))
if (payment_type == 1){
  payment_order <- "Credit Card"
} else if (payment_type == 2){
  payment_order <- "Bank Transfer"
} else if (payment_type == 3){
  payment_order <- "Cash"
}
#q7
print("IS THIS ORDER FOR DELIVERY OR CARRYOUT?")
print("1.Delivery 2.Carryout")
order_type <- as.integer(readLines("stdin",n=1))
if (order_type == 1){
  order <- "Delivery"
} else if (order_type == 2){
  order <- "Carryout"
} 
#q8
print("Do you want to use promotion code?")
print("1.Yes 2.No")
# promotion_code <- as.interger(readLines("stdin",n=1))

print("Order Summary")
cat(user_name, " Order ",pizza_order, "Pizza with ", appertizer_order , "and " , drink_order , ",Pay with ",payment_order ,", This order for " , order)
print("Have A Good Day!!")
#home work 02
#pao yubg chub
#user plays unlimited times
#keep reuslt win lose when exits program