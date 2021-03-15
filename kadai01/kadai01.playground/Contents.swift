let array = [2000,1209,1980,1790,1993]

func leapyear(year: Int) -> Bool {
    return (year%400 == 0) || (year%4 == 0 && year%100 != 0)
}

for num in array {
    print(leapyear(year: num))
}
