env = Environment()


def ghcit(base):
    env.Command(base, base + '.hs', 'ghc -o $TARGET $SOURCE')


def cmd(target, source, executable, args='$SOURCE > $TARGET'):
    env.Command(target, source, executable + ' ' + args)
    env.Depends(target, executable)

# Chapter 01
ghcit('ch01/wc03')
ghcit('ch01/wc04')
cmd('ch01/ch01-wc03.txt', 'ch01/ch01.md', './ch01/wc03')
cmd('ch01/ch01-wc04.txt', 'ch01/ch01.md', './ch01/wc04')
