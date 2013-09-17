Feature: Parser
  In order to more easily parse EYAML ENC blocks
  As a frustrated developer trying to enhance the edit mode
  I want to be given a set of tokens from EYAML input and our regex expressions

  Scenario: Parse with no regexs
    Given I make a parser instance with no regexs
    And I load a file called test_input.yaml
    When I parse the content
    Then I should have 1 token
    Then token 1 should be a NonMatchToken

  Scenario: Parse encrypted yaml
    Given I make a parser instance with the ENC regexs
    And I configure the keypair
    And I load a file called test_input.yaml
    When I parse the content
    Then I should have 33 tokens
    Then token 1 should be a NonMatchToken
    Then token 2 should be a EncToken
    Then token 2 should start with "ENC[PKCS7,MIIBiQYJKoZIhvcNAQ"
    Then token 2 should decrypt to start with "planet of the apes"

  Scenario: Parse decrypted yaml
    Given I make a parser instance with the DEC regexs
    And I load a file called test_plain.yaml
    When I parse the content
    Then I should have 2 tokens
    Then token 1 should be a NonMatchToken
    Then token 2 should be a EncToken
