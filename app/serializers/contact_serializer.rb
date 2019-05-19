class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate

  belongs_to :kind do
    link(:related) { kind_url(object.kind.id) }
  end

  has_many :phones, dependent: :destroy
  has_one :address, dependent: :destroy

  # link(:self) { contact_url(object.id) }
  # link(:kind) { kind_url(object.kind.id) }

  def attributes(*args)
    h = super(*args)
    h[:birthdate] = (I18n.l(object.birthdate) if object.birthdate.present?)
    h
  end

  meta do 
    {
      author: 'Wátila'
    }
  end
end
