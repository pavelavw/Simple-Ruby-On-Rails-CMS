class AdminUser < ActiveRecord::Base
   
   has_secure_password

   has_and_belongs_to_many  :pages
   has_many :section_edits
   has_many :sections, :through=>:section_edits, :class_name=>SectionEdit

   scope :sort_first, lambda{order("admin_users.created_at DESC") }
   scope :sort_last, lambda{order("admin_users.first_name.created_at ASC") }


   


  validates :first_name, :presence=> true,
                         :uniqueness=>true,
                         :length=>{:maximum=>35}

  validates :last_name,  :presence=> true,
                         :uniqueness=>true,
                         :length=>{ :maximum=>35}

  validates :username,  :presence=> true,
                         :uniqueness=>true,
                         :length=>{ :maximum=>35}



end
