e = 5
N = 84364443735725034864402554533826279174703893439763343343863260342756678609216895093779263028809246505955647572176682669445270008816481771701417554768871285020442403001649254405058303439906229201909599348669565697534331652019516409514800265887388539283381053937433496994442146419682027649079704982600857517093
C = 23701787746829110396789094907319830305538180376427283226295906585301889543996533410539381779684366880970896279018807100530176651625086988655210858554133345906272561027798171440923147960165094891980452757852685707020289384698322665347609905744582248157246932007978339129630067022987966706955482598869800151693
txt = "You see a Gold-Bug in one corner. It is the key to a treasure found by "
ZmodN = Zmod(N);

# this function finds the roots for the polynomial equation 
def coppersmith_roots(f, modulus, beta, m, t, Y):

    d = f.degree()
    n = d * m + t
    polynomial_Z = f.change_ring(ZZ)
    x = polynomial_Z.parent().gen()

    # we first compute the polynomials
    p_ = []
    for i in range(m):
        for k in range(d):
            p_.append((x * Y)**k * modulus**(m - i) * polynomial_Z(x * Y)**i)
    for i in range(t):
        p_.append((x * Y)**i * polynomial_Z(x * Y)**m)

    L = Matrix(ZZ, n)

    for i in range(n):
        for k in range(i+1):
            L[i, k] = p_[i][k]

    L = L.LLL()

    polynomial_new = 0
    for i in range(n):
        polynomial_new += x**i * L[0, i] / Y**i

    possible_roots = polynomial_new.roots()
    
    # now we test the possible_roots 
    roots = []
    for root in possible_roots:
        if root[0].is_integer():
            result = polynomial_Z(ZZ(root[0]))
            if gcd(modulus, result) >= modulus^beta:
                roots.append(ZZ(root[0]))

    return roots

# to break the RSA, we do Copper Smith Attack (padding text is known)
# let length of suffix be anything in [0, maxlenmsg]
def RSA_coppersmithattack(text_to_pad, maxlenmsg):
    global e, C, ZmodN

    pad_binary = ''.join(['{0:08b}'.format(ord(x)) for x in text_to_pad])

    for len in range(0, maxlenmsg+1, 4):          
        P.<M> = PolynomialRing(ZmodN)
        f = ((int(pad_binary, 2)<<len) + M)^e - C
        d = f.degree()
        beta = 1                                
        epsilon = beta/7                      
        m = ceil(beta**2/(d*epsilon))     
        t = floor(d*m*((1/beta) - 1))    
        Y = ceil(N**((beta**2/d) - epsilon))  

        roots = coppersmith_roots(f, N, beta, m, t, Y)

        if roots:
            # print ("Root is :", ' {0:b}'.format(roots[0]))
            return roots[0]
            
roots = RSA_coppersmithattack(txt, 300)
roots = bin(roots).replace("0b","")

def bin_2_txt(bin, length=8):
    if len(bin)%8 != 0:
        bin = bin.zfill(len(bin) + 8 - len(bin) % 8)
    t = ""
    for i in range(0, len(bin), length):
        t += chr(int(bin[i : i + 8], 2))
    return t
    
pswd = bin_2_txt(roots)
txt_msg = txt + pswd
print("M =", txt_msg)
#print(txt_msg)
print("The padding text in M is-",txt)
print("So, the root is", pswd)
print(pswd, "in binary is", roots)

