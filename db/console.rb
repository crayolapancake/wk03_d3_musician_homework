require('pry-byebug')
require_relative('../models/albums')
require_relative('../models/artists')

artist1 = Artists.new(
  {'name' => 'Folk Uke'})
artist1.save()

artist2 = Artists.new(
  {'name' => 'London Grammar'})
artist2.save()

artist3 = Artists.new(
  {'name' => 'Yeah Yeah Yeahs'})
artist3.save()

album1 = Albums.new(
  {'title' => 'Reincarnation',
  'genre' => 'folk'})
  album1.save()

  album2 = Albums.new(
    {'title' => 'If You Wait',
    'genre' => 'Indie'})
  album2.save()

  album3 = Albums.new(
    {'title' => 'Fever to Tell',
    'genre' => 'Indie'}
    )
