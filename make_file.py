import os

template = """package advent 

import "core:fmt"
import "core:strings"
import "core:strconv"


day_{day_num}_part_1 :: proc(file: string) -> (res: int) {
    file := file

    return
}

day_{day_num}_part_1_optimized :: proc(file: string) -> (res: int) {
    file := file
    
    return
}

day_{day_num}_part_2 :: proc(file: string) -> (res: int) {
    file := file

    return
}

day_{day_num}_part_2_optimized :: proc(file: string) -> (res: int) {
    file := file

    return
}
"""

day = 3
file_path = f"day{day}.odin"
assert not os.path.exists(file_path)

with open(file_path, "w") as f:
    f.write(template.replace("{day_num}", str(day)))
