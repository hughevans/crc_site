namespace :page_cache do
  # Thanks to http://www.railsenvy.com/2007/2/28/rails-caching-tutorial
  task :sweep => :environment do
    cache_dir = ActionController::Base.page_cache_directory
    unless cache_dir == "#{Rails.root}/public" # we don't want to blow away the entire public/ dir.
      FileUtils.rm_r(Dir.glob("#{cache_dir}/*")) rescue Errno::ENOENT
      RAILS_DEFAULT_LOGGER.info("Cache directory #{cache_dir} fully swept.")
    end
  end
end