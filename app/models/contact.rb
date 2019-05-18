class Contact < ApplicationRecord
  belongs_to :kind
  has_many :phones, dependent: :destroy
  has_one :address, dependent: :destroy

  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address, update_only: true # atualiza apenas, não criar novos registross

  # def kind_description
  #   kind.description
  # end
  #
  # # Sobreescrevendo o método
  # def as_json(options={})
  #   super(
  #     # root: true,
  #     methods: [:kind_description],
  #     include: {kind: {only: :description } }
  #   )
  # end

  # def to_br
  #   { 
  #     name: name,
  #     email: email,
  #     birthdate: (I18n.l(birthdate) if birthdate.present?),
  #     kind_id: kind_id
  #   }
  # end

  def as_json(options = {})
    h = super(options)
    h[:birthdate] = (I18n.l(birthdate) if birthdate.present?)
    h
  end
end
