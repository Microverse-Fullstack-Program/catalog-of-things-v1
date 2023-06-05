class App
  def main_menu
    puts 'Welcome to our catalog, Please select an Option: '
    options = [
      '1 - List All Books',
      '2 - List All Musics',
      '3 - List All Games',
      '4 - Quit'
    ]
    puts options
  end
end

app = App.new
app.main_menu
