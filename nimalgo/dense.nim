type
    Matrix*[T] = ref object
        mtx: seq[T]
        mrow: Natural
        mcol: Natural

proc row*[T](m: Matrix[T]): Natural =
    m.mrow

proc col*[T](m: Matrix[T]): Natural =
    m.mcol

proc `[]`*[T](mtx: Matrix[T], i: Natural, j: Natural): T =
    assert(i < mtx.row)
    assert(j < mtx.col)

    mtx.mtx[i * mtx.row + j]

proc `[]=`*[T](mtx: Matrix[T], i: Natural, j: Natural, data: T) =
    assert(i < mtx.row)
    assert(j < mtx.col)

    mtx.mtx[i * mtx.row + j] = data

proc newMatrix*[T](row: Natural, col: Natural): Matrix[T] =
    assert(row > 0)
    assert(col > 0)

    new(result)
    result.mtx = @[]
    result.mrow = row
    result.mcol = col

    for i in countup(0, row * col):
        result.mtx.add(T(0))

proc fromArray*[T](mtx: seq[seq[T]]): Matrix[T] =
    let row = mtx.len
    let col = mtx[0].len

    assert(row > 0)
    assert(col > 0)

    var m = newMatrix[T](row, col)

    for i in countup(0, mtx.len):
        for j in countup(0, mtx[0].len):
            m[i, j] = mtx[i][j]

    m