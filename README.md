# Configfiles
Collection of configuration files for my unix machines

# Usage

Grab the repo, then run make_links.py

    $ git clone git://github.com/jinalharia/configfiles.git
    $ cd configfiles
    $ ./make_links.py

If you have old configuration you want to wipe, pass '--force' to make_links:

    $ ./make_links.py --force

make_links will copy any file whose name is '.XXX' or '.XXX/YYY', except git metadata.
