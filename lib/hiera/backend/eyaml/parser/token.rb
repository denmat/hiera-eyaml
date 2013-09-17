class Hiera
  module Backend
    module Eyaml
      module Parser
        class TokenType
          attr_reader :regex
          @regex
          def create_token string
            raise 'Abstract method called'
          end
        end

        class Token
          attr_reader :match
          def initialize(match)
            @match = match
          end
          def to_s
            "#{self.class.name}:#{@match}"
          end
        end

        class NonMatchToken < Token
          def initialize(non_match)
            super(non_match)
          end
        end
      end
    end
  end
end