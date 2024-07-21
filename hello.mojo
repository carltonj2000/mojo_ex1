fn main():
    print("Hello, world!")
    var y = add_one(3)
    print(y)
    var mp = MyPair(4, 5)
    mp.dump()
    var mn = MyNumb(8)
    var mnat = mn.add_too(4)
    print(mnat)
    var mn2 = MyNumb(9)
    mod_my_nu(mn2)
    repeat[2]("hi")
    var z = my_pow(exp=3, base=3)
    print(z)
    var s = sum(3, 5, 1)
    print(s)
    var hello: String = "hello"
    var welcome: String = "welcome"
    var goodBy: String = "good-bye"
    make_worldly(hello, welcome, goodBy)
    print(hello, welcome, goodBy)
    print(count_many_things(5, 11.7, 2))


fn add_one(x: Int) -> Int:
    var y: Int = 1
    return x + y


struct MyPair:
    var first: Int
    var second: Int

    fn __init__(inout self, first: Int, second: Int):
        self.first = first
        self.second = second

    fn dump(self):
        print(self.first, self.second)


trait HasAdd:
    fn add_too(self, x: Int) -> Int:
        ...


@value
struct MyNumb(HasAdd):
    var first: Int

    fn __init__(inout self, first: Int):
        self.first = first

    fn dump(self):
        print(self.first)

    fn add_too(self, x: Int) -> Int:
        return self.first + x


fn mod_my_nu[H: HasAdd](x: H):
    var z = x.add_too(2)
    print(z)


fn repeat[count: Int](msg: String):
    for _i in range(count):
        print(msg)


fn my_pow(base: Int, exp: Int = 2) -> Int:
    return base**exp


fn sum(*values: Int) -> Int:
    var sum: Int = 0
    for value in values:
        sum = sum + value
    return sum


fn make_worldly(inout *strs: String):
    for s in strs:
        s[] += " world"


fn count_many_things[*ArgTypes: Intable](*args: *ArgTypes) -> Int:
    var total = 0

    @parameter
    fn add[Type: Intable](value: Type):
        total += int(value)

    args.each[add]()
    return total
