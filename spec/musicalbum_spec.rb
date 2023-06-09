require_relative '../item'
require_relative '../musicalbum'

RSpec.describe MusicAlbum do
  before do
    @music_album = MusicAlbum.new('Blood Brothers', '2010-10-01', on_spotify: true)
  end

  it 'Check if it is an instance of the class' do
    expect(@music_album).to be_instance_of MusicAlbum
  end

  it 'Check if it has a name attribute' do
    expect(@music_album.name).to eq 'Blood Brothers'
  end

  it 'Check if it has a publish date attribute' do
    expect(@music_album.publish_date).to eq Date.parse('2010-10-01')
  end

  it 'Check if it can be archived when on_spotify is true' do
    expect(@music_album.can_be_archived?).to be true
  end

  it 'Check if it cannot be archived when on_spotify is false' do
    music_album = MusicAlbum.new('Me and You', '1999-01-18', on_spotify: false)
    expect(music_album.can_be_archived?).to be false
  end

  it 'check when cannnot be archived when release date not older than 10 years' do
    music_album = MusicAlbum.new('Me and You', '2020-01-12', on_spotify: true)
    expect(music_album.can_be_archived?).to be false
  end

  it 'check it can  be archived when release date  older than 10 years and on_spotify is true' do
    music_album = MusicAlbum.new('Me and You', '2010-01-12', on_spotify: true)
    expect(music_album.can_be_archived?).to be true
  end
end
