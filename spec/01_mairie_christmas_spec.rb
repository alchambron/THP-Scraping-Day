require_relative('../lib/01_mairie_christmas')

url = 'http://www.annuaire-des-mairies.com/val-d-oise.html'

describe 'Testing the scraping of the mails of mairies of cities' do
  it 'Should Return the mail of Ableiges' do
    expect({ ableiges: 'mairie.ableiges95@wanadoo.fr' }).to include(ableiges: 'mairie.ableiges95@wanadoo.fr')
  end
end
