def A_to_D(s):
    value = 16 * (ord(s[0]) - 102) + ord(s[1]) - 102
    return value


def M(m, n):
    a = 0
    for i in range(8):
        if n & (1 << i):
            a ^= (m << i)
    for i in range(13, 6, -1):
        if a & (1 << i):
            a ^= (1 << i)
            a ^= (1 << (i - 6))
            a ^= (1 << (i - 7))
    return a


def Ep(b, p):
    if p <= 1:
        return b
    return M(b, Ep(b, p - 1))


for i in range(8): 
    pairs = set()
    E = list(range(1, 127))  # 127
    A = list(range(0, 128))  # 128
    for e in E:
        for a in A:
            pairs.add((e, a))

    with open('final' + str(i+1) + '.txt', 'r') as reader:

        # read S_i,T_i

        for ii in range(128):
            line = reader.readline()

            S_i = A_to_D(line[2*i:2*i+2])
            T_i = A_to_D(line[2*i+16:2*i+18])

            temp = set()
            for p in pairs:
                E = p[0]
                A = p[1]
                val1 = Ep(A, (E + E**2) % 127)
                val2 = Ep(S_i, E*((E**2)%127) % 127)
                value = M(val1, val2)
                if T_i != value:
                    temp.add(p)

            for q in temp:
                for p in pairs:
                    if p[0] == q[0] and p[1] == q[1]:
                        pairs.discard(p)
                        break
    f = open('pairs.txt', 'a')
    for p in pairs:
        a = str(p[0]) + ',' + str(p[1]) + '\n'
        f.write(a)
    f.write(" ------- \n")

