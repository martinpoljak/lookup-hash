Lookup Hash
===========

**lookup-hash** is intended for using as fast lookup table for simply 
checking of an existency of some item. It doesn't bring any additional 
performance, it's defacto only [Hash][1] with booleans, but it's
better to write:

    require "lookup-hash"
    allowed = LookupHash[:alfa, :beta]

…than:

   allowed = Hash[:alfa, true, :beta, true]
   
Other methods are equivalent to +Hash+ with exception of data assignment
methods which convert all values to booleans. New key is possible to add
also by:

    hash << :key    # …or…
    hash.add(:key)

Contributing
------------

1. Fork it.
2. Create a branch (`git checkout -b 20101220-my-change`).
3. Commit your changes (`git commit -am "Added something"`).
4. Push to the branch (`git push origin 20101220-my-change`).
5. Create an [Issue][2] with a link to your branch.
6. Enjoy a refreshing Diet Coke and wait.

Copyright
---------

Copyright &copy; 2011 [Martin Kozák][3]. See `LICENSE.txt` for
further details.

[1]: http://www.ruby-doc.org/core/classes/File.html
[2]: http://github.com/martinkozak/em-sequence/issues
[3]: http://www.martinkozak.net/
[4]: http://rubyeventmachine.com/
