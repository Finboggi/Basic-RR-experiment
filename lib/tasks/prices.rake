namespace :prices do
  namespace :update do
    desc 'Schedule jobs for prices update'
    task schedule: :environment do
      Link.all.each do |link|
        UpdatePriceForLinkJob.perform_later(link)
      end
    end

    desc 'Synchronous prices update'
    task synchronous: :environment do
      Link.all.each do |link|
        UpdatePriceForLinkJob.new.perform(link)
      end
    end
  end
end
