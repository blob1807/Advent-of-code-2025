package advent 

import "core:fmt"
import "core:strings"
import "core:strconv"


day_3_part_1 :: proc(file: string) -> (res: int) {
    file := file
    
    for line in strings.split_lines_iterator(&file) {
        line := transmute([]u8)line
        l, r := line[0], line[1]

        for c, p in line[1:len(line)-1] {
            switch {
            case l < c:
                l = c
                r = line[p+2]
            case r < c:
                r = c
            }
        }
        if c := line[len(line)-1]; r < c {
            r = c
        }
        res += int(l - '0') * 10 + int(r - '0')
    }

    return
}

day_3_part_1_optimized :: proc(file: string) -> (res: int) {
    file := file
    
    return
}

day_3_part_2 :: proc(file: string) -> (res: int) {
    file := file

    for line in strings.split_lines_iterator(&file) {
        line := transmute([]u8)line
        l, r := line[0], line[1]

        for c, p in line[1:len(line)-1] {
            switch {
            case l < c:
                l = c
                r = line[p+2]
            case r < c:
                r = c
            }
        }
        if c := line[len(line)-1]; r < c {
            r = c
        }
        res += int(l - '0') * 10 + int(r - '0')
    }  

    return
}

day_3_part_2_optimized :: proc(file: string) -> (res: int) {
    file := file

    return
}
