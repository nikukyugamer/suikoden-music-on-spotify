namespace :export_to_dist_csv_files do
  desc 'Export DB to All dist CSV files'
  task all: :environment do
    Rake::Task['export_to_dist_csv_files:artists'].invoke
    Rake::Task['export_to_dist_csv_files:albums'].invoke
    Rake::Task['export_to_dist_csv_files:features_all'].invoke
    Rake::Task['export_to_dist_csv_files:features_each'].invoke
  end

  desc 'Export DB to dist artists CSV file'
  task artists: :environment do
    ExportToDistCsv::ArtistsService.new.execute
  end

  desc 'Export DB to dist albums CSV file'
  task albums: :environment do
    ExportToDistCsv::AlbumsService.new.execute
  end

  desc 'Export DB to dist features CSV file for all albums'
  task features_all: :environment do
    ExportToDistCsv::FeaturesInAllAlbumsService.new.execute
  end

  desc 'Export DB to dist features CSV files for each album'
  task features_each: :environment do
    album_names = YAML.load_file(Rails.root.join('db/album_names.yml'))

    album_names.each do |album_name|
      ExportToDistCsv::FeaturesInEachAlbumService.new(album_name).execute
    end
  end
end
