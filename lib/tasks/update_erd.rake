namespace :update_erd do
  desc 'Update ERD by Rails ERD'
  task create_dot: :environment do
    # 直接 pdf を生成するのではなく、いったん dot を生成する（差分を可視化するため）
    # cf. https://github.com/voormedia/rails-erd
    sh 'bundle exec erd'
  end

  task convert_dot_to_pdf: :environment do
    # Graphviz がインストールされている必要がある
    # cf. https://graphviz.org/doc/info/command.html
    sh 'dot -Tpdf db/erd.dot -o db/erd.pdf'
  end
end
