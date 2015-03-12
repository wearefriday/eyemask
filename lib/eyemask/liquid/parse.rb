require 'liquid'

module Eyemask
  module Liquid
    module Parse

      def parse(input)
        ::Liquid::Template.parse(input).render(@context.registers)
      end

    end
  end
end

Liquid::Template.register_filter(Eyemask::Liquid::Parse)
