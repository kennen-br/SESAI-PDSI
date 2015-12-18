class InvestmentVillage < ActiveRecord::Base
  after_save :flush_cache

  def self.cached_villages
    Rails.cache.fetch('cached_villages', expires_in: 240.hours) do
      Village.all
    end
  end

  private

  def flush_cache
    Rails.cache.delete('cached_villages')
  end
end
