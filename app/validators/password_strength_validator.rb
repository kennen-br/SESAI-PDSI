class PasswordStrengthValidator < ActiveModel::Validator
  def validate(user)
    return unless user.id.nil?

    response  = true

    if user.password.length < 14
      response  = false
      user.errors[:password]  << 'Senha deve ter no mínimo 14 caracteres'
    end

    if user.password.scan(/[A-Z]/).empty?
      response  = false
      user.errors[:password]  << 'Senha deve ter pelo menos uma letra maiúscula'
    end

    if user.password.scan(/[0-9]/).empty?
      response  = false
      user.errors[:password]  << 'Senha deve ter pelo menos um número'
    end

    special_chars = %w{ ! @ # $ % ¨ & * ( ) - _ = + }
    unless user.password.each_char.any? { |c| special_chars.include? c }
      response  = false
      user.errors[:password]  << 'Senha deve ter pelo menos um caractere especial'
    end
  end
end
