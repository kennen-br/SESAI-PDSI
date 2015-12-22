class InvestmentCity < ActiveRecord::Base
  after_save :flush_cache

  def self.cached_cities
    Rails.cache.fetch('cached_cities', expires_in: 240.hours) do
      Village.all
    end
  end

  private

  def flush_cache
    Rails.cache.delete('cached_cities')
  end
end
