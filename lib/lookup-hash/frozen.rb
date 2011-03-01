# encoding: utf-8
# (c) 2011 Martin Kozák (martinkozak@martinkozak.net)

require "lookup-hash"

##
# Hash intended for using as fast lookup table for simply checking of an 
# existency of some item. It doesn't bring any additional performance,
# it's defacto only Hash with Booleans, but it's better to write:
#
#   class Foo
#       CONST = Frozen::LookupHash[:alfa, :beta]
#   end
#
# than:
#   class Foo
#       CONST = Hash[:alfa, true, :beta, true].freeze
#   end
#
# Implicitly frozen for use in class constants.
#

module Frozen
    class LookupHash < ::LookupHash
        ##
        # Creates lookup hash. Expects key names as input. If array given,
        # treat it as just array of keys.
        #
        # @return [Hash] new hash
        #
        
        def self.[](*args)
            result = super(*args)
            result.freeze
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
        #   to Boolean in the {LookupHash}. Assigning of default value block
        #   isn't allowed.
        # @see http://ruby-doc.org/core/classes/Hash.html#M000718
        #

        def initialize
            super
            self.freeze
        end
    end
end
