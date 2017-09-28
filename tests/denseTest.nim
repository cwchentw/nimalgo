import unittest, nimalgo/dense

suite "Test dense matrix":
    test "newMatrix":
        let m = newMatrix[float](3, 2)
        check(m.row == 3)
        check(m.col == 2)

        check(m[0, 0] == 0)
        check(m[0, 1] == 0)
        check(m[1, 0] == 0)
        check(m[1, 1] == 0)
        check(m[2, 0] == 0)
        check(m[2, 1] == 0)

    test "fromArray":
        let m = fromArray[float](
            @[@[1.0, 2.0, 3.0],
              @[2.0, 3.0, 4.0]]
        )

        check(m.row == 2)
        check(m.col == 3)

        check(m[0, 0] == 1)
        check(m[0, 1] == 2)
        check(m[0, 2] == 3)
        check(m[1, 0] == 2)
        check(m[1, 1] == 3)
        check(m[1, 2] == 4)
