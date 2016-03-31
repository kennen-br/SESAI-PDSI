class PhysiographicData < ActiveRecord::Base
  auditable

  belongs_to :pdsi
  belongs_to :village

  has_many :physiographic_data_languages
  accepts_nested_attributes_for :physiographic_data_languages, reject_if: :all_blank, allow_destroy: true

  has_many :physiographic_data_ethnicities
  accepts_nested_attributes_for :physiographic_data_ethnicities, reject_if: :all_blank, allow_destroy: true

  validates_presence_of :physiographic_data_languages,
                        :physiographic_data_ethnicities,
                        :m_1,
                        :pt_fluency,
                        :m_1,
                        :m_1_4,
                        :m_5_9,
                        :m_10_49,
                        :m_50_59,
                        :m_60,
                        :w_1,
                        :w_1_4,
                        :w_5_9,
                        :w_10_49,
                        :w_50_59,
                        :w_60,
                        :m_1,
                        :m_1_4,
                        :m_5_9,
                        :m_10_49,
                        :m_50_59,
                        :m_60,
                        :w_1,
                        :w_1_4,
                        :w_5_9,
                        :w_10_49,
                        :w_50_59,
                        :w_60
end
