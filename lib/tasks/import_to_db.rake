namespace :import_to_db do
  desc 'Import CSV files to DB'
  task all: :environment do
    ImportToDb::ArtistService.new.execute
    ImportToDb::AlbumService.new.execute
    ImportToDb::TrackService.new.execute
    ImportToDb::FeatureService.new.execute
  end
end
