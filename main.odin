package advent 

import "core:fmt"
import "core:time"
import win "core:sys/windows"
import "base:runtime"
import "base:intrinsics"
import "core:os"

import "core:unicode/utf16"


digit_count_table := [?]u64 {
    0, 9, 99, 999, 9999, 99999, 999999, 9999999, 99999999, 999999999, 9999999999,
    99999999999, 999999999999, 9999999999999, 99999999999999, 999999999999999,   
    9999999999999999, 99999999999999999, 999999999999999999, 9999999999999999999,
    18446744073709551615
}
digit_count :: proc { digit_count_unsigned, digit_count_signed }
digit_count_unsigned :: proc "contextless" ( x: u64 ) -> ( count: u64 ) #no_bounds_check {
    count = (((intrinsics.count_leading_zeros(x|1) ~ 63) * 77) >> 8) + 1
    return count + u64(x > digit_count_table[count])
}
digit_count_signed :: proc "contextless" ( x: i64 ) -> ( count: i64 ) {
    return i64(digit_count(u64(abs(x))))
}

parse_int :: proc "contextless" ( str: string ) -> ( res: int ) #no_bounds_check {
    for pos: int; pos < len(str); pos += 1 {
        n := str[pos]
        if n < '0' || '9' < n {
            break
        }
        res = (res * 10) + int(n - '0')
    } 
    return
}

main :: proc() { 
    win.SetConsoleOutputCP(.UTF8)

    file := #load("day2.txt", string)
    //file := FILE

    start := time.tick_now()
    res := day_2_part_2_optimized(file)
    end := time.tick_since(start)
    fmt.println(res, end)

}


FILE :: "11-22,95-115,998-1012,1188511880-1188511890,222220-222224," + \
"1698522-1698528,446443-446449,38593856-38593862,565653-565659," + \
"824824821-824824827,2121212118-2121212124"

/*

Day 1:
    P1: 80-140µs
    P2: 

Dat 2:
    P1: 6.5ms
    P2: 65ms ; 52ms

Day 3:
    P1: 35-55µs
    P2:

Day 4:
    P1:  
    P2:

Day 5:
    P1:
    P2:

Day 6:
    P1:  
    P2:
*/