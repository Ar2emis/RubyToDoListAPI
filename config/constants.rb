module Constants
  BODY_SIZE = (10..256).freeze
  POSITION_RANGE = %w[up down].freeze

  PASSWORD_REGEX = /\A[\w\d]+\z/.freeze
  PASSWORD_MIN_LENGTH = 8
  USERNAME_LENGTH = (3..50).freeze
end