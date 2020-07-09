module Giphy
  class Term
    def self.build_batch_from(array_or_hash)
      if array_or_hash.is_a?(Array)
        array_or_hash.map { |term| new(term) }
      else
        new(array_or_hash)
      end
    end

    def initialize(hash)
      @hash = hash
    end

    def name
      hash.fetch('name')
    end

    private

    attr_reader :hash
  end
end
