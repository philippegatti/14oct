

class User
  attr_accessor :email
  attr_accessor :age
  @@user_all = [] # on initialise la liste des utilisateurs

  def initialize(email_to_save, age)
    @email = email_to_save
    @age = age
    @@user_all << self # un utilisateur vient d'être créé : on ajoute donc à la liste
  end

  def self.all
    return @@user_all
  end

  def self.find_by_email(user_email)
    @@user_all.each do |user| 
      if user.email.includ == user_email
      return user
      end
    end
  end

end #fin de ma classe

