class Contact < ApplicationRecord
  belongs_to :kind

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
end
