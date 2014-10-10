#!/usr/bin/python -W ignore::DeprecationWarning
import sys
import gtk


# http://askubuntu.com/questions/16620/is-there-a-command-line-tool-which-returns-the-colour-of-the-pixel-based-on-scre
# http://stackoverflow.com/questions/12741880/how-to-load-image-files-to-gtk-gdk-pixbuf-from-stream


def loadimg(pic, x, y):
    loader = gtk.gdk.PixbufLoader('jpeg')
    loader.write(pic)
    loader.close()

    pixbuf = loader.get_pixbuf()
    return pixbuf.get_pixels_array()[x][y]


def loadpic(path, x, y):
    f = open(path, 'rb')
    pic = f.read()
    f.close()
    color = loadimg(pic, x, y)
    return "%0.2X%0.2X%0.2X" % (color[0], color[1], color[2])

print loadpic(sys.argv[1], int(sys.argv[2]), int(sys.argv[3]))
