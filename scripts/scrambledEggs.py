#!/usr/bin/env python3

if __name__ == '__main__':
    from sys import platform
    if not platform.startswith('linux'):
        from sys import stderr
        print('Sorry; this only works in Linux!', file=stderr)
        exit(1)
    from os import system
    from random import randint
    keys = [ 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 38, 39, 40, 41, 42, 43, 44, 45, 46, 52, 53, 54, 55, 56, 57, 58  ]
    values = ['q Q q Q', 'w W w W', 'e E e E', 'r R r R', 't T t T', 'y Y y Y', 'u U u U', 'i I i I', 'o O o O', 'p P p P', 'a A a A', 's S s S', 'd D d D', 'f F f F', 'g G g G', 'h H h H', 'j J j J', 'k K k K', 'l L l L', 'z Z z Z', 'x X x X', 'c C c C', 'v V v V', 'b B b B', 'n N n N', 'm M m M' ]

    usedKeys = []
    keysEndPt = len(keys) - 1
    for key in keys:
        r = randint(0, keysEndPt)
        k = keys[r]
        while k in usedKeys or k == key:
            r = randint(0, keysEndPt)
            k = keys[r]
        usedKeys.append(k)
        system('xmodmap -e \'keycode {} = {}\''.format(key, values[r]))
        print('{} ==> {}'.format(values[keys.index(key)][0], values[r][0]))
