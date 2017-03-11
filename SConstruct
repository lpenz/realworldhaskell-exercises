# -*- python -*-

import os

if False:
    Environment = None

env = Environment(ENV=os.environ)


def ghcmain(base):
    d = os.path.dirname(base)
    env.Command(base, base + '.hs', 'ghc -o ${TARGET.file} ${SOURCE.file}', chdir=d)
    env.SideEffect(['%s.o' % base, '%s.hi' % base], 'ch05/Main')


def ghcmod(base):
    env.Command(base + '.o', base + '.hs', 'ghc $SOURCE')
    env.SideEffect(base + '.hi', base + '.o')


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
cmd('ch03/convexhull-ok.txt', [], './ch03/Directions',
    ' && md5sum ./ch03/Directions | tee $TARGET')

# Chapter 04
ghcmod('ch04/Ch04')
ghcmain('ch04/firstword')
cmd('ch04/ch04-firstword.txt', 'ch04/ch04.md',
    './ch04/firstword', '$SOURCE $TARGET')
ghcmain('ch04/transpose')
cmd('ch04/ch04-transpose.txt', 'ch04/helloworld.txt',
    './ch04/transpose', '$SOURCE $TARGET')
ghcmod('ch04/AsInt')
ghcmod('ch04/Folds')


# Chapter 05
def ghcmod05(base):
    env.Command('ch05/%s.o' % base, 'ch05/%s.hs' % base,
                'ghc -c ${TARGET.file} ${SOURCE.file}', chdir='ch05')
    env.SideEffect('ch05/%s.hi' % base, 'ch05/%s.o' % base)


ghcmod05('PutJSON')
ghcmod05('Prettify')
ghcmod05('PrettyJSON')
ghcmod05('SimpleJSON')
env.Command('ch05/Main', 'ch05/Main.hs',
            'ghc -o ${TARGET.file} ${SOURCE.file}', chdir='ch05')
env.SideEffect(['ch05/Main.o', 'ch05/Main.hi'], 'ch05/Main')
