#!/usr/bin/expect
log_file -a game_outputs.log
spawn ssh student@65.0.124.36
expect  "student@65.0.124.36's password:"
send -- "caesar\r"

expect  "group name:"
send -- "Conundrum\r"

expect  "word:"
send -- "qwerty\r"

expect  "at:"
send -- "4\r"

expect  "> "
send -- "read\r"

expect  "> "
send -- "qrslfqgtipujpogs\r"

expect  "> "
send -- "c\r"

expect  "> "
send -- "qrsloqfthpujuogs\r"

expect  "> "
send -- "c\r"

expect  "> "
send -- "kskhnijhgntnosmu\r"

expect  "> "
send -- "c\r"

expect  "> "
send -- "kskhgikhfntnrsmu\r"

expect  "> "
send -- "c\r"

expect  "> "
send -- "tslkrkkmnpfqtlsm\r"

expect  "> "
send -- "c\r"

expect  "> "
send -- "tslkkkjmopfqqlsm\r"

expect  "> "
send -- "c\r"

expect  "> "
send -- "rsinftkkihioifqo\r"

expect  "> "
send -- "c\r"

expect  "> "
send -- "rsinotjkhhiolfqo\r"

expect  "> "
send -- "c\r"

expect  "> "
send -- "fjgflmpmqofflpig\r"

expect  "> "
send -- "c\r"

expect  "> "
send -- "fjgfumqmpoffipig\r"

expect  "> "
send -- "c\r"

expect  "> "
send -- "luqlngjfsgftjtjq\r"

expect  "> "
send -- "c\r"

expect  "> "
send -- "luqlggkfrgftgtjq\r"

expect  "> "
send -- "c\r"

expect  "> "
send -- "sofjjfqnogqtjqgg\r"

expect  "> "
send -- "c\r"

expect  "> "
send -- "sofjsfpnngqtgqgg\r"

expect  "> "
send -- "c\r"

expect  "> "
send -- "fmoltqluotlnrouk\r"

expect  "> "
send -- "c\r"

expect  "> "
send -- "fmolmqmuntlnoouk\r"

expect  "> "
send -- "c\r"

expect  "> "
send -- "njnfghqrjkqlfjuq\r"

expect  "> "
send -- "c\r"

expect  "> "
send -- "njnfnhprkkqlkjuq\r"

expect  "> "
send -- "c\r"

expect  "> "
send -- "qtqjotmrtgumtgnr\r"

expect  "> "
send -- "c\r"

expect  "> "
send -- "qtqjftlrugumqgnr\r"

expect  "> "
send -- "c\r"

