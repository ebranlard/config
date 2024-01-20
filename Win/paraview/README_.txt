
--- METHOD 1 - Chose given graphics card
Windows Settings > Screen/Display > Graphics > Add application (Paraview) > Options > Choose graphics card




---- METHOD 2 (MESA DRIVERS)

Copy opengl32.dll to paraview/bin

(library taken from: https://fdossena.com/?p=mesa/index.frag)

In a command prompt:

set MESA_GL_VERSION_OVERRIDE=4.5
paraview.exe


See also this thread:

https://discourse.paraview.org/t/i-am-using-paraview-5-8-0-on-windows-10-and-my-gui-is-completely-broken-with-missing-icons-what-is-happening/4509
