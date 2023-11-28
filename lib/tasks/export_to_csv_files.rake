namespace :export_to_csv_files do
  desc 'Export to CSV files'
  task all: :environment do
    ExportToCsv::ArtistsService.new.execute
    ExportToCsv::AlbumsService.new.execute
    ExportToCsv::TracksInEachAlbumService.new.execute
  end
end