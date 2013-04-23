multikinect
===========

This repository contains codes where I explore multiple kinect cameras connected to one computer, also it contains various plugins which might be required when working on the teeve game-engine.
----------------------------
Installing vim for OpenCL 
----------------------------
The link below was helpful in adding OpenCL support for vim. 
"http://www.vim.org/scripts/script.php?script _ id=3157"

The 'opencl.vim' has been put in the main folder, and the steps are: 
install details
Place file within /syntax 
Edit filetype.vim: 

add lines -   
" OpenCL 
au BufNewFile,BufRead * .cl	 setf opencl 

Remove- (stop vim from recognizing * .cl as common lisp) 
* .cl from Lisp 

----------------------------
Installing python wrappers from libfreenect
----------------------------
Firstly install the libfreenect library. See the manual build under OSX. 
i.e. http://openkinect.org/wiki/Getting_Started#Manual_Build_under_OSX

----------------------------
Installing python plugins: 
After installing the libfreenect libraries, as mentioned above. Just goto the /libfreenect/wrappers/python and then run the command: 
sudo python setup.py install 
This will install everything you need. 
Note, there are a lot of plugins that might be required, so install the things on the fly. However, below I will try to enter the libraries required. 
libusb from : http://sourceforge.net/projects/libusb/
----------------------------

----------------------------
Parallel usage with pyusb
----------------------------
Input: 
If you also want to use pyusb to play with the Kinect, you will need libusb-1.0.8 (it seems). Install it via homebrew and then define the _lib variable before finding the usb device:

Output: 
from ctypes import *
import usb.core
import usb.utils

_lib = CDLL('/usr/local/Cellar/libusb/1.0.8/lib/libusb-1.0.dylib') # That's the location homebrew puts the libusb libraries
dev = usb.core.find(idVendor=0x045e, idProduct=0x02B0)

Read more here: http://openkinect.org/wiki/Getting_Started#OS_X
----------------------------


