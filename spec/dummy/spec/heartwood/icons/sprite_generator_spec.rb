require 'generators/heartwood/decorator/sprite_generator'

RSpec.describe Heartwood::Decorator::SpriteGenerator do

  let(:sprite_file) { 'app/assets/images/icons.svg' }

  after(:each) { FileUtils.rm(sprite_file) if File.exist?(sprite_file) }

  it 'creates a sprite file at app/assets/images/icons.svg' do
    system("bundle exec rails generate heartwood:icons:sprite")
    exp_sprite = File.read(File.expand_path('../../support/sprite.svg', __dir__))
    expect(File.read(sprite_file)).to eq(exp_sprite)
  end

end
