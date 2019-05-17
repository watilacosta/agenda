class Contact < ApplicationRecord
  belongs_to :kind

  # Sobreescrevendo o método
  def as_json(options={})
    super(
      # root: true,
      include: {kind: {only: :description } }
    )
  end
end
