s = 'EBG KVVV vf n fvzcyr yrggre fhofgvghgvba pvcure gung ercynprf n yrggre jvgu gur yrggre KVVV yrggref nsgre vg va gur nycunorg. EBG KVVV vf na rknzcyr bs gur Pnrfne pvcure, qrirybcrq va napvrag Ebzr. Synt vf SYNTFjmtkOWFNZdjkkNH. Vafreg na haqrefpber vzzrqvngryl nsgre SYNT.'

m = ord('v')-ord('i')

ans = []
for c in s:
    code = ord(c)

    if 65 <= code <= 90:
        code += 13
        if code > 90:
            code -= 26

    elif 97 <= code <= 122:
        code += 13
        if code > 122:
            code -= 26

    ans.append(chr(code))

print(*ans, sep='')
