import unittest, nimalgo/utils

suite "Test utils":
    test "eol":
        when system.hostOS == "windows":
            check(eol() == "\r\n")
        else:
            check(eol() == "\n")