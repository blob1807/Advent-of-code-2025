package advent 

import "core:fmt"
import "core:strings"
import "core:strconv"
import "base:intrinsics"


day_2_part_1 :: proc(file: string) -> (res: u64) {
    file := file
    pow_10 := [10]u64{
        1,10,100,1000,10000,100000,
        1000000,10000000,100000000,
        1000000000,
    }

    for str in strings.split_by_byte_iterator(&file, ',') {
        i := strings.index_byte(str, '-')
        a, b := str[:i], str[i+1:]
        x, y := u64(parse_int(a)), u64(parse_int(b))

        for n in x..=y {
            size := digit_count(n)
            if size % 2 != 0 { continue }
            p := pow_10[size / 2]
            l := n / p
            r := n - (l * p)
            if l == r {
                res += n
            }
        }
    }

    return
}

day_2_part_1_optimized :: proc(file: string) -> (res: u64) {
    file := file

    return
}

day_2_part_2 :: proc(file: string) -> (res: u64) {
    file := file
    pow_10 := [10]u64{
        1,10,100,1000,10000,100000,
        1000000,10000000,100000000,
        1000000000,
    }

    for str in strings.split_by_byte_iterator(&file, ',') {
        i := strings.index_byte(str, '-')
        a, b := str[:i], str[i+1:]
        x, y := u64(parse_int(a)), u64(parse_int(b))

        for n in x..=y {
            size := digit_count(n)
            is_odd := size % 2 != 0
            half := size / 2

            // if odd the first case will always be false
            loop: for pos in (half + u64(is_odd) )..<size {
                if size % (size-pos) != 0 {
                    continue
                }
                l := n / pow_10[pos]
                for i in 0..<(size / (size-pos) - 1) {
                    idx := pos-((size-pos) * i)
                    pow_r := pow_10[idx]
                    r := n - (n / pow_r) * pow_r
                    r = r / pow_10[idx - (size-pos)]

                    if l != r {
                        continue loop
                    }
                }
                res += n
                break
            }
        }
    }
    return
}

day_2_part_2_optimized :: proc(file: string) -> (res: u64) {
    file := file
    pow_10 := [10]u64{
        1,10,100,1000,10000,100000,
        1000000,10000000,100000000,
        1000000000,
    }

    for str in strings.split_by_byte_iterator(&file, ',') {
        i := strings.index_byte(str, '-')
        a, b := str[:i], str[i+1:]
        x, y := u64(parse_int(a)), u64(parse_int(b))

        for n in x..=y {
            size := digit_count(n)
            // if odd the first case will always be false
            half := size / 2 + size % 2

            loop: for pos in half..<size {
                if size % (size-pos) != 0 {
                    continue
                }
                
                pow_l := pow_10[pos]
                l := n / pow_l
                rb := n - (l * pow_l)
                pow := pow_10[(size-pos)]

                for i in 0..<(size / (size-pos) - 1) {
                    rt := rb / pow
                    r := rb - (rt * pow)
                    rb = rt

                    if l != r {
                        continue loop
                    }
                }
                res += n
                break
            }
        }
    }

    return
}
