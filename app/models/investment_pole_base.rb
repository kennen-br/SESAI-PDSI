class InvestmentPoleBase < ActiveRecord::Base
  after_save :flush_cache

  def self.cached_pole_bases
    Rails.cache.fetch('cached_pole_bases', expires_in: 240.hours) do
      Village.all
    end
  end

  private

  def flush_cache
    Rails.cache.delete('cached_pole_bases')
  end
end
