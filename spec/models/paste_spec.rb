require 'rails_helper'

describe Paste do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:contents) }
end
