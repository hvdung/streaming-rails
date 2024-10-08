require 'rails_helper'

RSpec.describe MovieForm, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:file) }
end
