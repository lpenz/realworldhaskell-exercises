env = Environment()


def ghcmain(base):
    env.Command(base, base + '.hs', 'ghc -o $TARGET $SOURCE')


def ghcmod(base):
    env.Command(base, base + '.hs', 'ghc $SOURCE')


def cmd(target, source, executable, args='$SOURCE > $TARGET'):
    env.Command(target, source, executable + ' ' + args)
    env.Depends(target, executable)

# Chapter 01
ghcmain('ch01/wc03')
ghcmain('ch01/wc04')
cmd('ch01/ch01-wc03.txt', 'ch01/ch01.md', './ch01/wc03')
cmd('ch01/ch01-wc04.txt', 'ch01/ch01.md', './ch01/wc04')

# Chapter 02
ghcmod('ch03/Directions')
ghcmod('ch03/Intersperse')
ghcmod('ch03/ListMean')
ghcmod('ch03/ListSort')
ghcmod('ch03/MyLen')
ghcmod('ch03/MyTree')
ghcmod('ch03/Palindrome')
