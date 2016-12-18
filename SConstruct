# -*- python -*-

import os

env = Environment(ENV=os.environ)


def ghcmain(base):
    env.Command(base, base + '.hs', 'ghc -o $TARGET $SOURCE')


def ghcmod(base):
    env.Command(base + '.o', base + '.hs', 'ghc $SOURCE')


def cmd(target, source, executable, args='$SOURCE > $TARGET'):
    env.Command(target, source, executable + ' ' + args)
    env.Depends(target, executable)


# Chapter 01
ghcmain('ch01/wc03')
ghcmain('ch01/wc04')
cmd('ch01/ch01-wc03.txt', 'ch01/ch01.md', './ch01/wc03')
cmd('ch01/ch01-wc04.txt', 'ch01/ch01.md', './ch01/wc04')

# Chapter 03
ghcmain('ch03/Directions')
ghcmod('ch03/Intersperse')
ghcmod('ch03/ListMean')
ghcmod('ch03/ListSort')
ghcmod('ch03/MyLen')
ghcmod('ch03/MyTree')
ghcmod('ch03/Palindrome')
cmd('ch03/convexhull-ok.txt', [], './ch03/Directions', ' && md5sum ./ch03/Directions | tee $TARGET')

# Chapter 04
ghcmod('ch04/Ch04')
ghcmain('ch04/firstword')
cmd('ch04/ch04-firstword.txt', 'ch04/ch04.md',
    './ch04/firstword', '$SOURCE $TARGET')
ghcmain('ch04/transpose')
cmd('ch04/ch04-transpose.txt', 'ch04/helloworld.txt',
    './ch04/transpose', '$SOURCE $TARGET')
