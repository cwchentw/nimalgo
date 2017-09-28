# Package

version       = "0.1.0"
author        = "Michael Chen"
description   = "Common data structures and algorithms in Nim."
license       = "MIT"

skipDirs = @["tests"]

# Dependencies

requires "nim >= 0.17.2"

task test, "Run tests":
  withDir "tests":
    exec "nim c -r *"
