//: ## Functions 2 Exercises
//: In these exercise, you will be given the description for functions and their expected output assuming they are implemented correctly. It will be your job to finish the implementations.
/*:
### Exercise 1

Write two versions of a function called overloadingFun. One version accepts a single `String` parameter and the other accepts a single `Int` parameter. Both functions should return a `String` describing the input value.

Hint: See the example function calls to determine how to implement each function.

*/
func overloadingFun(s1: String) /* define return type */ {

}

func overloadingFun(num: Int) /* define return type */ {

}

/* Example Function Call

overloadingFun("softball") // "I'm a String with the value: softball"
overloadingFun(12) // "I'm an Int with the value: 12"
overloadingFun(591) // "I'm an Int with the value: 591"
overloadingFun("") // "I'm a String with the value: "

*/

//: ### Exercise 2
//: Write a function `medianAndAverage` that takes three `Int` parameters and returns a tuple with the type `(Int, Double)` where the first value is the median of the input values and the second value is the average of the input values.
func medianAndAverage(/* define parameters */) /* define return type */ {

}

/* Example Function Call

medianAndAverage(num1: 1, num2: 5, num3: 6) // (5, 4)
medianAndAverage(num1: 2, num2: 1, num3: 6) // (2, 3)
medianAndAverage(num1: 3, num2: 15, num3: 9) // (9, 9)
medianAndAverage(num1: -10, num2: 11, num3: 0) // (0, 0.333)
medianAndAverage(num1: 1, num2: 2, num3: 5) // (2, 2.666)
medianAndAverage(num1: 2, num2: 3, num3: 1) // (2, 2)
medianAndAverage(num1: 2, num2: 2, num3: 1) // (2, 1.666)

*/

/*:
### Exercise 3

Write a function called `updateStudentRecord` that takes three parameters: a `StudentRecord`, an `Int` for pointsEarned, and an `Int` for pointsPossible. This function should modify the `StudentRecord` parameter by adding to its current pointsEarned and pointsPossible properties. Then, the function should return the updated `StudentRecord` (remember it is a copy, not a reference).

*/
struct StudentRecord {
    let id: Int
    let name: String
    var pointsEarned: Int
    var pointsPossible: Int
}

func updateStudentRecord(/* define parameters */) /* define return type */ {
}

var record1 = StudentRecord(id: 1, name: "James", pointsEarned: 56, pointsPossible: 60)

/* Example Function Call

record1 = updateStudentRecord(record1, pointsEarned: 10, pointsPossible: 10)
record1.pointsEarned // 66
record1.pointsPossible // 70

record1 = updateStudentRecord(record1, pointsEarned: 4, pointsPossible: 7)
record1.pointsEarned // 70
record1.pointsPossible // 77

*/

/*:
### Exercise 4

Write a function called `updateStudentRecordInOut` that performs the same task as `updateStudentRecord` except it operates upon an in-out `StudentRecord` parameter.

Hint: Should this function return a value? See the example function calls for help.

*/
func updateStudentRecordInOut(/* define parameters */) /* define return type */ {
}

var record2 = StudentRecord(id: 2, name: "Jarrod", pointsEarned: 27, pointsPossible: 30)

/* Example Function Call

updateStudentRecordInOut(&record2, pointsEarned: 4, pointsPossible: 8)
record2.pointsEarned // 31
record2.pointsPossible // 38

updateStudentRecordInOut(&record2, pointsEarned: 8, pointsPossible: 9)
record2.pointsEarned // 39
record2.pointsPossible // 47

*/

/*:
### Exercise 5 (Bonus Problem!)

Rewrite the nested function `innerFunction` such that the example function calls return the correct values.

Hint: The `outerFunction` implements [Exclusive OR](https://en.wikipedia.org/wiki/Exclusive_or) (XOR) which is a logical operator that returns true when there is an odd number of inputs that are true.
*/
func outerFunction(input1 input1: Bool, input2: Bool) -> Bool {
    
    func innerFunction(a a: Bool, b: Bool) -> Bool {
        return false
        /* rewrite this function */
    }
    
    return innerFunction(a: input1, b: input2) || innerFunction(a: input2, b: input1)
}

/* Example Function Call

outerFunction(input1: false, input2: false) // false
outerFunction(input1: false, input2: true) // true
outerFunction(input1: true, input2: false) // true
outerFunction(input1: true, input2: true) // false
outerFunction(input1: outerFunction(input1: true, input2: true), input2: false) // false
outerFunction(input1: outerFunction(input1: false, input2: true), input2: false) // true

*/
