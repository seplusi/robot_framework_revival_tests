def lines_should_be_shorter_than(lines: str, max: int):
    count = 0
    for line in lines.split('\n'):
        if len(line) > max:
            print(f'Line "{line}" has size is bigger than {max}')
            count = count + 1

    return  count