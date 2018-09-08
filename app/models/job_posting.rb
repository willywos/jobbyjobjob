class JobPosting < ApplicationRecord
  include PgSearch
  multisearchable :against => [:title, :company]

  pg_search_scope :search_by_title,
                  :against => {
                    :title => 'A',
                    :company => 'B'
                  },
                  :using => {
                    :tsearch => { dictionary: 'english', :any_word => true, :prefix => true, :normalization => 2}
                  },
                  :order_within_rank => "job_postings.publish_date DESC"


  def self.search_sort_by_pub_date(searchTerm)
    results = JobPosting.search_by_title(searchTerm)
    results = results.sort { |x,y| y.publish_date <=> x.publish_date }
    results
  end

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
