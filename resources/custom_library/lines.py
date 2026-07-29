def lines_should_be_shorter_than(lines: str, max: int):
    count = 0
    for line in lines.split('\n'):
        if len(line) > max:
            print(f'Line "{line}" has size is bigger than {max}')
            count = count + 1
    assert count == 0, f'{count} lines were bigger then {max}'

    return  f'All lines are smaller than {max} chars'

