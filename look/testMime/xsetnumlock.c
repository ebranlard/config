#include <X11/extensions/XTest.h>
#include <X11/keysym.h>

/*
Requires:
aptitude install libxcb-keysyms1-dev libxtst-dev
Compiled with:
gcc -I/usr/include/X11 -L/usr/lib/X11 -o xsetnumlock xsetnumlock.c -lX11 -lXtst  */

int main(void){
    Display* disp = XOpenDisplay(NULL);

    if (disp == NULL) return 1;

    XTestFakeKeyEvent(disp, XKeysymToKeycode(disp, XK_Num_Lock),
            True, CurrentTime);
    XTestFakeKeyEvent(disp, XKeysymToKeycode(disp, XK_Num_Lock),
            False, CurrentTime );
    XCloseDisplay(disp);

    return 0;
}
