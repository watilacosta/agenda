class Contact < ApplicationRecord

  def say_hello
    "Hello, I'm #{name}"
  end

  # Sobreescrevendo o método
  def as_json(options={})
    super(methods: :say_hello, root: true)
  end
end
