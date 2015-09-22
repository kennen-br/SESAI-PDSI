class Emsi < ActiveRecord::Base
  belongs_to :base_polo
  belongs_to :pdsi

  validates :name,  length: { maximum: 255 }, presence: true

  def generate_name(bp = nill)
    polobase = base_polo || bp
    base_polo_id = polobase.id
    total = polobase.emsis.count
    "EMSI #{base_polo_id}.#{total+1}"
  end
end
