//Write a for loop to count down from 10 to 1

for var i = 10; i >= 1; i-- {
    print(i)
}


//Exercise ANSWER

for i in 1...16 {
    for j in 1...16 {
        if i % 4 == 0 && j % 4 == 0 {
            print("🆒", terminator: "")
        } else if j % 2 == i % 2 {
            print("⬛", terminator: "")
        } else {
            print("⬜️", terminator: "")
        }
    }
    print("")
}

