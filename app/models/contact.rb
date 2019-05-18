class Contact < ApplicationRecord
  belongs_to :kind
  has_many :phones

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

  def to_br
    { 
      name: name,
      email: email,
      birthdate: (I18n.l(birthdate) if birthdate.present?),
      kind_id: kind_id
    }
  end
end
