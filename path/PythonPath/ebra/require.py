from userpath import PATH


def require(library=None,version=None):
    import sys
    p=PATH()
    if library:
        try:
            path=eval('p.%s'%library)
            sys.path.insert(0,path)
            print('require: adding path %s'%path)
        except Exception,e:
            raise e

    

