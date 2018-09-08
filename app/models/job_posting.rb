class JobPosting < ApplicationRecord
  include PgSearch
  multisearchable :against => [:title, :company]

  pg_search_scope :search_by_title,
                  :against => {
                    :title => 'A',
                  },
                  :using => {
                    :tsearch => { dictionary: 'english', :any_word => true, :prefix => true}
                  }


  def company_initials
    unless self.company.blank?
      initials = ''
      self.company.split(' ').each do |word|
        initials += word.chars.first.upcase
      end
      initials
    end
  end

  def random_color
    "%06x" % (company_initials.sum * 0xcd3)
  end
end
