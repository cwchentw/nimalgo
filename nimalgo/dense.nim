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

    mtx.mtx[i * mtx.col + j]

proc `[]=`*[T](mtx: Matrix[T], i: Natural, j: Natural, data: T) =
    assert(i < mtx.row)
    assert(j < mtx.col)

    mtx.mtx[i * mtx.col + j] = data

proc newMatrix*[T](row: Natural, col: Natural): Matrix[T] =
    assert(row > 0)
    assert(col > 0)

    new(result)
    result.mtx = @[]
    result.mrow = row
    result.mcol = col

    for i in countup(1, row * col):
        result.mtx.add(T(0))

proc fromArray*[T](mtx: seq[seq[T]]): Matrix[T] =
    let row = mtx.len
    let col = mtx[0].len

    assert(row > 0)
    assert(col > 0)

    result = newMatrix[T](row, col)

    for i in countup(0, mtx.len - 1):
        for j in countup(0, mtx[0].len - 1):
            result[i, j] = mtx[i][j]
