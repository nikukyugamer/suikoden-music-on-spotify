namespace :export_to_dist_csv_files do
  desc 'Export to dist CSV files for all albums'
  task all: :environment do
    ExportToDistCsv::FeaturesInAllAlbumsService.new.execute
  end

  desc 'Export to dist CSV files for each album'
  task each: :environment do
    album_names = YAML.load_file(Rails.root.join('db/album_names.yml'))

    album_names.each do |album_name|
      ExportToDistCsv::FeaturesInEachAlbumService.new(album_name).execute
    end
  end
end
