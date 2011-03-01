# encoding: utf-8
# (c) 2011 Martin Kozák (martinkozak@martinkozak.net)

require "hash-utils/hash"
require "hash-utils/object"

##
# Hash intended for using as fast lookup table for simply checking of an 
# existency of some item. It doesn't bring any additional performance,
# it's defacto only Hash with Booleans, but it's better write:
#   CONST = LookupHash[:alfa, :beta]
#
# than:
#   CONST = Hash[:alfa, true, :beta, true]
#

class LookupHash < Hash
    ##
    # Creates lookup hash. Expects key names as input. If array given,
    # treat it as just array of keys.
    #
    # @return [Hash] new hash
    #
    
    def self.[](*args)
        if args.first.kind_of? Array
            args = args.first
        end
        
        new = [ ]
        args.each do |i|
            new << [i, true]
        end
        
        super(new)
    end
    
    ##
    # Returns a new, empty hash. If this hash is subsequently accessed 
    # by a key that doesn‘t correspond to a hash entry, the value 
    # returned depends on the style of new used to create the hash. In 
    # the first form, the access returns nil. If obj is specified, 
    # this single object will be used for all default values. If a block
    # is specified, it will be called with the hash object and the key, 
    # and should return the default value. It is the block‘s 
    # responsibility to store the value in the hash if required.
    #
    # @note All values will be converted using +hash-utils+ Hash#to_b 
    #   to Boolean in the {LookupHash}.
    # @see http://ruby-doc.org/core/classes/Hash.html#M000718
    #

    def initialize(*args)
        super(*args)
        self.map_values! { |v| v.to_b }
    end

    ##
    # Element Assignment—Associates the value given by value with the 
    # key given by key. key should not have its value changed while it 
    # is in use as a key (a +String+ passed as a key will be duplicated 
    # and frozen).
    #
    # @note Value will be converted using +hash-utils+ Hash#to_b 
    #   to Boolean in the {LookupHash}.
    # @see http://ruby-doc.org/core/classes/Hash.html#M000729
    #
    
    def []=(key, value)
        super(key, value.to_b)
    end
end


p LookupHash[:alfa, :beta]
