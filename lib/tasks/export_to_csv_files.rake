namespace :export_to_csv_files do
  desc 'Export to CSV files'
  task all: :environment do
    ExportToCsv::ArtistsService.new.execute
    ExportToCsv::AlbumsService.new.execute
    ExportToCsv::TracksInEachAlbumService.new.execute

    # 時間がかかる（約10分）ので注意する
    ExportToCsv::AudioFeaturesService.new.execute
  end
end
