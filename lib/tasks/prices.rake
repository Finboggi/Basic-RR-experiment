# frozen_string_literal: true

namespace :prices do
  namespace :update do
    desc 'Schedule jobs for prices update'
    task schedule: :environment do
      Link.find_each do |link|
        UpdatePriceForLinkJob.perform_later(link.id)
      end
    end

    desc 'Synchronous prices update'
    task synchronous: :environment do
      Link.find_each do |link|
        UpdatePriceForLinkJob.new.perform(link.id)
      end
    end
  end
end
