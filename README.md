# Configfiles
Collection of configuration files for my unix machines

# Usage

Grab the repo, then run create_links.py

    $ git clone git://github.com/jinalharia/configfiles.git
    $ cd configfiles
    $ ./create_links.py

If you have old configuration you want to wipe, pass '--force' to create_links:

    $ ./create_links.py --force

make_links will copy any file whose name is '.XXX' or '.XXX/YYY', except git metadata.
