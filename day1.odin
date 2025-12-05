package advent

import "core:fmt"
import "core:strings"
import "core:time"
import sa "core:container/small_array"
import "core:slice"
import "core:strconv"
import "core:math"

day_1_part_1 :: proc(file: string) -> (res: int) {

    pos: int = 50
    _file := file[:len(file)-2]
    for line in strings.split_lines_iterator(&_file) {
        num, ok := strconv.parse_int(line[1:], 10)
        switch line[0] {
        case 'L': pos -= num
        case 'R': pos += num
        }
        pos %%= 100
        if pos == 0 { res += 1 }
    }

    return
}


day_1_part_1_optimized :: proc(file: string) -> (res: int) {
    count: i64 = 50
    for pos: int; pos < len(file); /**/ {
        n: int
        num, _ := strconv.parse_i64_of_base(file[pos+1:], 10, &n)
        count = ( count + (file[pos] == 'L' ? -num : num) ) %% 100
        if count == 0 { res += 1 }
        pos += 2 + n
    }

    return
}


day_1_part_2 :: proc(file: string) -> (res: int) {
    
    pos: int = 50
    _file := file[:len(file)-2]
    
    for line in strings.split_lines_iterator(&_file) {
        num, ok := strconv.parse_int(line[1:], 10)
        switch line[0] {
        case 'L':
            diff := pos - num
            pos = diff %% 100
            res += (100 - abs(diff)) / 100
            if pos == 0 { res += 1 }

        case 'R':
            sum := pos + num
            pos = sum %% 100
            res += sum / 100
        }
    }

    /*
    2525 - Too Low
    */
        

    return
}


day_1_part_2_optimized :: proc(file: string) -> (res: int) {

    return
}