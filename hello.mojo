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
