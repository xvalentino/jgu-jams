require 'rails_helper'

RSpec.describe User, type: :model do
  let(:tino) { User.create(username: 'tino') }

  it 'should have many songs' do
    expect(tino).to respond_to(:songs)
  end
end
