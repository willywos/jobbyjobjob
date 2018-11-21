# == Schema Information
#
# Table name: job_postings
#
#  id           :bigint(8)        not null, primary key
#  title        :string
#  description  :text
#  publish_date :datetime
#  company      :string
#  url          :string
#  logo         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  job_board    :string
#

class JobPosting < ApplicationRecord
  include PgSearch
  has_many :saved_jobs
  has_many :users, through: :saved_jobs

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

  pg_search_scope :find_matching_by_title,
                  :against => :title,
                  :using => {
                    :tsearch => { dictionary: 'english', :normalization => 4}
                  },

                  :order_within_rank => "job_postings.publish_date DESC"

  scope :unsaved, -> {where(:is_saved => false)}

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
    company_initials.blank? ? "000" : "%06x" % (company_initials.sum * 0xcd3)
  end

  def description_formatted
    ActionView::Base.full_sanitizer.sanitize(self.description, :tags => %w(img br p), :attributes => %w(src style))
  end

  def description_formatted_for_post
    #removes duplicate <br><br> and <p><p> tags that are grouped together.
    self.description.gsub(/(<br>){2,}/, "")
                    .gsub(/(<p>){2,}/, "")
  end
end
