proc eol*(): string =
    if system.hostOS == "windows":
        return "\r\n"

    return "\n"